class LowStockController < ApplicationController
  def index
    @products = Product.low_stock
    if @products.length <= 0
      flash.now[:notice] = "Todos los productos estan sobre el stock minimo"
    end
  end
end
