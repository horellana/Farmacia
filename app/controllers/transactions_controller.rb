class TransactionsController < ApplicationController
  before_action :setup_shopping_cart

  def new
    @transaction = Transaction.new
  end

  private

  def setup_shopping_cart
    if session[:shopping_cart_id]
    then
      @shopping_cart = shopping_cart.find session[:shopping_cart_id]
    else
      @shopping_cart = shopping_cart.create
    end

    session[:shopping_cart_id] = @shopping_cart.id
  end
end
