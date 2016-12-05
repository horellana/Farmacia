class ProductController < ApplicationController
 
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
#insert intro
        @product = Cliente.new(nombre: params[:product][:nombre],
                        telefono: params[:product][:telefono],
                        mail: params[:product][:mail],
                        contraseña: params[:product][:contraseña])
        if @product.save
                redirect_to @product
        else
                render :new
        end
  end
  
end
