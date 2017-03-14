class CartItemController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def create
    query = params[:search_product_field]
    quantity = params[:product_quantity].to_i

    begin
      product = Product.find_by! name: query
      @cart_item = @cart.add(product, quantity)
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Producto no encontrado'
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = 'El stock no puede ser menor a cero!'
    end

    respond_to :js
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.decrease_quantity
  end
end
