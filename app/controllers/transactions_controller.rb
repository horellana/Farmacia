class TransactionsController < ApplicationController
  before_action :setup_cart
  before_action :avoid_empty_cart, only: :create

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    @transaction = Transaction.new iva: 0.19,
                                   date: Time.now,
                                   user: current_user

    set_transaction_client

    @cart.items.each do |item|
      @transaction.add_product(item.product, item.quantity)
    end

    clean_cart
    redirect_to @transaction
  end

  private

  def set_transaction_client
    if session[:client_rut]
      begin
        client = Client.find_by! rut: session[:client_rut]
        client.transactions << @transaction
      rescue ActiveRecord::RecordNotFound
        client = Client.new
        client.rut = session[:client_rut]
        client.save!
        @transaction.client = client
      end
    end

    @transaction.save!
  end

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      return redirect_to :back
    end
  end
end
