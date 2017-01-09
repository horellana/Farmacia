class ProductsController < ApplicationController
  autocomplete :product, :name
  before_action :authenticate_user!
  before_action :setup_cart

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    category = Category.find_by description: params[:category_description]
    ingredient = MedicinalIngredient.find_by name: params[:medicinal_ingredient_name]
    provider = Provider.find_by name: params[:provider_name]
    dose = Dose.find_by kind: params[:dose_kind]


    @product = Product.new name: params[:product][:name],
                           description: params[:product][:description],
                           sale_price: params[:product][:sale_price],
                           purchase_price: params[:product][:purchase_price],
                           exempt: params[:product][:exempt],
                           commission: params[:product][:commision],
                           stock: params[:product][:stock],
                           minimum_stock: params[:product][:minimum_stock],
                           be: params[:product_be],
                           isp: params[:product_isp],
                           discount: params[:product][:discount]

    @product.isp = false if not @product.isp

    @product.category = category
    @product.medicinal_ingredient = ingredient
    @product.provider = provider
    @product.dose = dose

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  private

  def product_param
    params
      .require(:product)
      .permit(:name, :description, :sale_price, :purchase_price,
              :exempt, :commission, :be, :isp, :discount, :description)
  end
end
