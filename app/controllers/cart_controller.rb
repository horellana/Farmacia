class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def new
    redirect_to @cart
  end

  def show
  end

  def update
    query = params[:search_product_field]
    product = Product.find_by name: query
    @cart.add(product)

    redirect_to @cart
  end

  def destroy
    session[:cart_id] = nil
    redirect_to new_cart_path
  end

  private

  def setup_cart
    begin
      @cart = Cart.find session[:cart_id]
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end
end
