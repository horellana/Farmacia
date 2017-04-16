class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :check_open_box!
  before_action :setup_cart, only: [:show, :destroy, :new]

  def new
    redirect_to @cart
  end

  def destroy
    clean_cart
    redirect_to new_cart_path
  end

  def check_open_box!
    if not box_open?
      flash[:alert] = 'Falta abrir la caja'
      redirect_to root_path
    end
  end
end
