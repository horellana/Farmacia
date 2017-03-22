class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :admin_only, except: [:index, :show, :autocomplete_product_name]

  autocomplete :product, :name

  def new
    @product = Product.default_product
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    @product = Product.default_product

    FillProductService.new(@product, params).call

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    FillProductService.new(@product, params).call

    if @product.save
      redirect_to @product
    else
      @product = Product.default_product
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: 'Producto eliminado correctamente'
  end
end
