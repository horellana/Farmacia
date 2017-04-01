class WastesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  
  def new
    @waste = Waste.new
  end

  def index
    @wastes = Waste.all
  end

  def show
    @waste = Waste.find params[:id]
  end

  def create
    @waste = Waste.new
    @waste.product = Product.find_by(code: params[:product_code])
    @waste.office = Office.find_by(address: params[:office_address])
    
    @waste
      .inventory
      .update(@params[:waste][:inventory_attributes].permit(:stock))
    
    
    if @waste.save
      redirect_to @waste
    else
      render :new
    end
  end

  def edit
    @waste = Waste.find(params[:id])
  end

  def update
    @waste = Waste.find(params[:id])

    if @waste.save
      redirect_to @waste
    else
      @waste = Waste.update(waste_params)
      render :edit
    end
  end

  def destroy
    @waste = Waste.find(params[:id])
    @waste.destroy
    redirect_to root_path, notice: 'Merma eliminada correctamente'
  end
  
  
  
  
  private
     def waste_params
          params.require(:waste).permit(:amount, :description, :motive, :date)
     end

end
