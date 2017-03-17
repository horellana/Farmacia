class LaboratoriesController < ApplicationController
  autocomplete :laboratory, :name
  before_action :authenticate_user!

  before_action :admin_only, except: [:index, :show]

  def new
    @laboratory = Laboratory.new
  end

  def index
    @laboratory = Laboratory.all
  end

  def show
    @laboratory = Laboratory.find(params[:id])
  end

  def create
    @laboratory = Laboratory.new(name: params[:laboratory][:name],)
    if @laboratory.save
      flash[:notice] = "Laboratorio creado."
      redirect_to @laboratory
    else
      render :action => 'new'
    end
  end


  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  def update
    @laboratory = Laboratory.find(params[:id])

    if @laboratory.update(laboratory_params)
      redirect_to @laboratory
    else
      render 'edit'
    end
  end


  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    redirect_to laboratories_path
  end




  private
  def laboratory_params
    params.require(:laboratory).permit(:name)
  end

end
