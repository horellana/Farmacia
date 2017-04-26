class CreateSaleService
  def initialize(user, cart, box_movement, params)
    @user = user
    @cart = cart
    @params = params
    @box_movement = box_movement
  end

  def call
    @transaction = Transaction.new(user: @user,
                                   cart: @cart,
                                   box_movement: @box_movement)

    load_cart_items
    load_payments

    return @transaction
  end

  private

  def load_payments
    if @params[:payment_amount_cash]
      p = Payment.new(
        transactionn: @transaction,
        payment_method: PaymentMethod.find_by(description: 'Efectivo'),
        amount: @params[:payment_amount_cash]
      )

      @transaction.payments << p
    end

    if @params[:payment_amount_tarjeta]
      p = Payment.new(
        transactionn: @transaction,
        payment_method: PaymentMethod.find_by(description: 'Tarjeta'),
        amount: @params[:payment_amount_tarjeta]
      )

      @transaction.payments << p
    end

    if @params[:payment_amount_cheque]
      p = Payment.new(
        transactionn: @transaction,
        payment_method: PaymentMethod.find_by(description: 'Cheque'),
        amount: @params[:payment_amount_cheque]
      )

      @transaction.payments << p
    end
  end

  def load_cart_items
    @cart.items.each do |item|
      @transaction.add_product(item.product, item.quantity)
    end
  end
end



# @transaction = Transaction.new user: current_user,
#                                cart: @cart,
#                                box_movement: BoxMovement.last

# monto_pago = params[:monto_pago].to_i

# @transaction.payed_amount = monto_pago
# @transaction.payment_method = PaymentMethod.find params['tipo_pago']

# @cart.items.each do |item|
#   @transaction.add_product(item.product, item.quantity)
# end

# if @transaction.save
#   clean_cart
#   return redirect_to @transaction
# else
#   flash[:alert] = @transaction.errors[:payed_amount].to_sentence
#   return redirect_back(fallback_location: new_cart_path)
# end
