class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def new
    redirect_to @cart
  end

  def show
  end

  def update
    if params[:remove_product_id]
      @cart.remove(params[:remove_product_id])
    end

    if params[:set_rut]
      puts "sesion[:client_rut] = #{params[:set_rut]}"
      session[:client_rut] = params[:set_rut]
    end

    if params[:search_product_field]
      begin
        query = params[:search_product_field]
        product = Product.find_by name: query
        @cart.add(product)
      rescue ActiveRecord::RecordInvalid
        flash[:alert] = 'Producto no encontrado'
      end
    end

    respond_to :js
  end

  def destroy
    session[:cart_id] = nil
    redirect_to new_cart_path
  end
end
