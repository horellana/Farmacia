class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart, only: [:show, :destroy, :new]

  def new
    begin
      authorize @cart
      redirect_to @cart
    rescue Pundit::NotAuthorizedError
      flash[:alert] = 'Falta abrir la caja'
      redirect_to root_path
    end
  end

  def destroy
    clean_cart
    redirect_to new_cart_path
  end
end
