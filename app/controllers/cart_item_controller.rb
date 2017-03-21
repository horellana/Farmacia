class CartItemController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def create
    logger.info "Agregando un item al carro de compras"

    query = params[:search_product_field]
    quantity = params[:product_quantity].to_i

    logger.info "query=#{query}\nquantity=#{quantity}"

    begin
      logger.info "Buscando al producto = `#{query}`"
      product = Product.find_by!(name: query)
      @cart_item = @cart.add(product, quantity)
    rescue ActiveRecord::RecordNotFound
      logger.info "Producto no encontrado"
      flash[:alert] = "Producto no encontrado"
    end

    respond_to :js
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.decrease_quantity
  end
end
