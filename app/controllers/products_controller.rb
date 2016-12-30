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
    category = Category.find_or_create_by! description: params[:category_description]
    ingredient = MedicinalIngredient.find_or_create_by! name: params[:medicinal_ingredient_name]
    provider = Provider.find_or_create_by! name: params[:provider_name]
    dose = Dose.find_or_create_by! kind: params[:dose_kind]


    @product = Product.new name: params[:product][:name],
                           description: params[:product][:description],
                           sale_price: params[:product][:sale_price],
                           purchase_price: params[:product][:purchase_price],
                           exempt: params[:product][:exempt],
                           commission: params[:product][:commision],
                           be: params[:product][:be],
                           isp: params[:product][:isp],
                           discount: params[:product][:discount]

    @product.category = category
    @product.medicinal_ingredient = ingredient
    @product.provider = provider
    @product.dose = dose

    @product.save!

    redirect_to @product
  end

  private

  def product_param
    params
      .require(:product)
      .permit(:name, :description, :sale_price, :purchase_price,
              :exempt, :commission, :be, :isp, :discount, :description)
  end
end
