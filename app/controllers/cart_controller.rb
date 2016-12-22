class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart, only: [:show, :destroy, :new]

  def new
    redirect_to @cart
  end

  def destroy
    clean_cart
    redirect_to new_cart_path
  end
end
