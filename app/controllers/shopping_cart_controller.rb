class ShoppingCartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_shopping_cart

  def create
    @product = Product.find(params[:product_id])

    redirect_to shopping_cart_path
  end

  def update
    product = Product.find_by name: params[:search_product_field]
    puts "FOUND: #{product}"
    @shopping_cart.add(product, product.sale_price)
    redirect_to shopping_cart_path
  end

  private

  def setup_shopping_cart
    begin
      @shopping_cart = ShoppingCart.find session[:shopping_cart_id]
    rescue ActiveRecord::RecordNotFound
      @shopping_cart = ShoppingCart.create
    end

    session[:shopping_cart_id] = @shopping_cart.id
  end
end
