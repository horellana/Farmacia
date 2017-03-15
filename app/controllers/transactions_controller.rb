class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :avoid_empty_cart, only: :create

  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    @transaction = Transaction.new user: current_user,
                                   cart: @cart,
                                   box_movement: BoxMovement.last

    puts "monto_pago = #{params[:monto_pago].to_i}"
    monto_pago = params[:monto_pago].to_i

    @transaction.payed_amount = monto_pago
    @transaction.save

    @cart.items.each do |item|
      @transaction.add_product(item.product, item.quantity)
    end


    if @transaction.save
      clean_cart
      redirect_to @transaction
    else
      flash[:alert] = @transaction.errors.full_messages.to_sentence
      redirect_back(fallback_location: new_cart_path)
    end

  end

  def ticket
    @transaction = Transaction.find params[:transaction_id]
    render 'ticket.txt.erb', layout: false
  end

  private

  def set_transaction_client
    rut = session[:client_rut]
    name = session[:client_name]

    @transaction.client = Client.from_rut(rut) if rut
    @transaction.client.name = name if name && rut
  end

  def avoid_empty_cart
    if @cart.empty?
      flash[:alert] = 'El carrito esta vacio!'
      redirect_back(fallback_location: new_cart_path)
    end
  end
end
