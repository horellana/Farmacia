class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :avoid_empty_cart, only: :create

  def show
    @transaction = Transaction.find params[:id]
  end

  def create
    @transaction = Transaction.new user: current_user,
                                   cart: @cart,
                                   box_movement: BoxMovement.last

    set_transaction_client
    @transaction.save!

    @cart.items.each do |item|
      @transaction.add_product(item.product, item.quantity)
    end

    @transaction.save!

    clean_cart
    redirect_to @transaction
  end

  def ticket
    @transaction = Transaction.find params[:transaction_id]
    @monto_pago = params[:monto_pago].to_i

    if @monto_pago < @transaction.total
      return redirect_to :back,
                         alert: "El monto de pago no puede ser menor a $#{@transaction.total}"
    else
      @vuelto = @monto_pago - @transaction.total
      return render 'ticket.txt.erb', layout: false
    end
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
