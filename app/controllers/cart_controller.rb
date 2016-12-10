class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def new
    redirect_to @cart
  end

  def show
  end

  def update
    begin
      if params[:remove_product_id]
        @cart.remove(params[:remove_product_id])
      else
        query = params[:search_product_field]
        product = Product.find_by name: query
        @cart.add(product)
      end
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = 'Producto no encontrado'
    end

    respond_to :js
  end

  def destroy
    session[:cart_id] = nil
    redirect_to new_cart_path
  end
end
