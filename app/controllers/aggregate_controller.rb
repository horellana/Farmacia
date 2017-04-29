class AggregatesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def new
    @aggregate =Aggregate.new
  end

  def index
    @aggregate = Aggregate.all
  end

  def show
    @aggregate = Aggregate.find params[:id]
  end

  def create
    @aggregate = Aggregate.new
    @aggregate.product = Product.find_by(code: params[:product_code])
    @aggregate.office = Office.find_by(address: params[:office_address])

    @aggregate.stock = params[:waste][:stock]

    @aggregate.inventory = Inventory.find_by product: @aggregate.product,
                                         office: @aggregate.office
    @aggregate.inventory.(@waste.amount)

    if @aggregate.save
      redirect_to @aggregate
    else
      render :new
    end
  end


  private
  def aggregate_params
    params.require(:aggregate).permit(:amount, :description, :motive, :date)
  end
end
