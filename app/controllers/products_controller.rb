class ProductsController < ApplicationController
  autocomplete :product, :name
  before_action :authenticate_user!
  before_action :setup_cart

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
        @product = Product.new(name: params[:product][:name],
                        description: params[:product][:description],
                        sale_price: params[:product][:sale_price],
                        purchase_price: params[:product][:purchase_price],
                        exempt: params[:product][:exempt],
                        commission: params[:product][:commission],
                        be: params[:product][:be],
                        isp: params[:product][:isp],
                        discount: params[:product][:discount]
                        )
        if @product.save
              redirect_to @product
        else
              render 'new'
        end
  end

end
