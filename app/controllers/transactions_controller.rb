class TransactionsController < ApplicationController
  before_action :setup_cart
  before_action :avoid_empty_cart, only: :create

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    @transaction = Transaction.new user: current_user

    set_transaction_client

    @cart.items.each do |item|
      @transaction.add_product(item.product, item.quantity)
    end

    @transaction.save!
    clean_cart
    redirect_to @transaction
  end

  private

  def set_transaction_client
    if session[:client_rut]
      @transaction.client = Client.from_rut(session[:client_rut])
    end
  end

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      return redirect_to :back
    end
  end
end
