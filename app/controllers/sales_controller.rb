# coding: utf-8
class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :setup_payment_methods

  def new
  end

  def create
    @transaction = CreateSaleService
                     .new(current_user,
                          @cart,
                          BoxMovement.last,
                          params)
                     .call

    if @transaction.save
      clean_cart
      redirect_to @transaction
    else
      render :new
    end
  end

  private
  def setup_payment_methods
    @payment_methods = []

    if params[:Efectivo]
      @payment_methods.append(PaymentMethod.find_by description: 'Efectivo')
    end

    if params[:Tarjeta]
      @payment_methods.append(PaymentMethod.find_by description: 'Tarjeta')
    end

    if params[:Cheque]
      @payment_methods.append(PaymentMethod.find_by description: 'Cheque')
    end

  end
end
