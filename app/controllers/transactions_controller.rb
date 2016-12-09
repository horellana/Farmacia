class TransactionsController < ApplicationController
  before_action :setup_cart

  def create
    avoid_emtpy_cart
  end

  private

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      redirect_to :back
    end
  end
end
