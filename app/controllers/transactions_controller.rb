class TransactionsController < ApplicationController
  before_action :setup_cart

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    avoid_empty_cart

    now = Time.now
    @transaction = Transaction.new

    @cart.items.each do |item|
      td = TransactionDetail.new
      td.product = item.product
      td.transactionn = @transaction
      td.quantity = item.quantity
      td.unit_price = item.product.sale_price
      td.net_price = item.product.price
      td.discount = item.product.discount
      td.devolution = 'no'
      td.update_time = now
    end

    # @transaction.kind = 'nose'
    @transaction.iva = 0.19
    # @transaction.net_amount = @transaction.calc_net_amount
    # @transaction.discount = @transaction.calc_discount
    # @transaction.total_amount = @transaction.calc_total_amount

    @transaction.save!

    # el carrito de compras ya no es necesario
    session[:cart_id] = nil

    redirect_to @transaction
  end

  private

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      redirect_to :back
    end
  end
end
