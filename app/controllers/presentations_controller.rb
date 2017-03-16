class PresentationsController < ApplicationController
  autocomplete :presentation, :name
  before_action :authenticate_user!

  before_action :admin_only, except: [:index, :show]

  def new
    @presentation = Presentation.new
  end

  def index
    @presentation = Presentation.all
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def create
    @presentation = Presentation.new(name: params[:presentation][:name],)
    if @presentation.save
      flash[:notice] = "presentacion Creada."
      redirect_to @presentation
    else
      render :action => 'new'
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])

    if @presentation.update(presentation_params)
      redirect_to @presentation
    else
      render 'edit'
    end
  end


  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy

    redirect_to presentations_path
  end


  private
  def dose_params
    params.require(:presentation).permit(:name)
  end
end
