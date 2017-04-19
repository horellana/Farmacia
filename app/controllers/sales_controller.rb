# coding: utf-8
class SalesController < ApplicationController
  def new
    @payment_methods = []

    if params[:Efectivo]
      @payment_methods.append(PaymentMethod.find_by description: 'Efectivo')
    end

    if params[:Tarjeta]
      @payment_methods.append(PaymentMethod.find_by description: 'Tarjeta')
    end
  end

  def create
  end
end
