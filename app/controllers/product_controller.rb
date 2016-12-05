class ArticlesController < ApplicationController
 
  def new
    @product = Product.new
  end

  def index
    @product = Product.all
  end
 
  def show
    @product = Product.find(params[:id])
  end
 
  def create
    @product = Product.new( params.require(:product).permit(:name, :price, :category_id) )

    if @product.save
      redirect_to @product, notice: 'El producto ha sido creado.'
    else
      render :new
  end