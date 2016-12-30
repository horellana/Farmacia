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


  def product_param
    params.require(:product).permit(:name, :description, :sale_price, :purchase_price, :exempt, :commission, :be,
                                    :isp, :discount, :description)
  end

  def create
    category = Category.create description: params[:category_description]
    category.save!
    
    @product = Product.new(product_param)
    @product.category = category
    @product.save!
    
    redirect_to
  end
end
