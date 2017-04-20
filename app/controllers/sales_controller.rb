# coding: utf-8
class SalesController < ApplicationController
  before_action :authenticate_user!

  def new
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

    puts(@payment_methods.length)
  end

  def create
  end
end
