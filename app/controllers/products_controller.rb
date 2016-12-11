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
                                      :isp, :discount, :description, :dose_id, :category_id, :medicinal_ingredient_id, :provider_id )
  end

  def create
        @product = Product.new(product_param)
        @product.save!
  end
  
  


end
