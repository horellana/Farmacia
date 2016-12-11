class TransactionsController < ApplicationController
  before_action :setup_cart
  before_action :avoid_empty_cart, only: :create

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    now = Time.now
    @transaction = Transaction.new

    @transaction.date = now
    @transaction.iva = 0.19

    if params[:client_rut]
      puts "CLIENTE #{params[:client_rut]}"
      begin
        puts "SETEANDO CLIENTE"
        client = Client.find_by! rut: params[:client_rut]
        client.transactions << @transaction
      rescue ActiveRecord::RecordNotFound
        puts "CLIENTE NO ENCONTRADO"
        client = Client.new
        client.rut = params[:client_rut]
        puts "GRABANDO NUEVO CLIENTE"
        client.save!
        @transaction.client = client
      end

      puts "EL CLIENTE ES: #{@transaction.client}"
    end

    @transaction.save!

    @cart.items.each do |item|
      td = TransactionDetail.new
      td.product = item.product
      td.quantity = item.quantity
      td.unit_price = item.product.price
      td.net_price = item.product.price - (item.product.price * 0.19)
      td.discount = item.product.discount
      td.devolution = 'no'
      td.update_time = now
      td.user = current_user
      td.transactionn = @transaction
      td.save!
    end

    # el carrito de compras ya no es necesario
    session[:cart_id] = nil

    redirect_to @transaction
  end

  private

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      return redirect_to :back
    end
  end
end
