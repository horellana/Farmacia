class WastesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  autocomplete :waste, :code

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

    @waste.amount = params[:waste][:amount]
    @waste.motive = params[:waste][:motive]

    @waste.inventory = Inventory.find_by product: @waste.product,
                                         office: @waste.office


    begin
      date = DateTime.parse(params[:waste][:date])
      @waste.date = date
    rescue ArgumentError
      return render :new, alert: 'Fecha invalida'
    end


    if not @waste.valid?
      return render :new
    end

    @waste.inventory.decrease_stock(@waste.amount)

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
