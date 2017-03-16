class PrinciplesController < ApplicationController
  autocomplete :principle, :name
  before_action :authenticate_user!

  before_action :admin_only, except: [:index, :show]

  def new
    @principle = Principle.new
  end

  def index
    @principle = Principle.all
  end

  def show
    @principle = Principle.find(params[:id])
  end


  def create
    @principle = Principle.new(name: params[:principle][:name],)
    if @principle.save
      flash[:notice] = "Principio activo creado."
      redirect_to @principle
    else
      render :action => 'new'
    end
  end

    def edit
    @principle = Principle.find(params[:id])
  end

  def update
    @principle = Principle.find(params[:id])

    if @principle.update(principle_params)
      redirect_to @principle
    else
      render 'edit'
    end
  end


  def destroy
    @principle = Principle.find(params[:id])
    @principle.destroy

    redirect_to principles_path
  end


  private
    def principle_params
      params.require(:principle).permit(:name)
  end

end
