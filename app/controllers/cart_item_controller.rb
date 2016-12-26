class CartItemController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def create
    query = params[:search_product_field]

    begin
      product = Product.find_by! name: query
      @cart.add(product)
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Producto no encontrado'
    end

    respond_to :js
  end

  def destroy
    CartItem.find(params[:id]).decrease_quantity
  end
end
