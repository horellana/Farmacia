class LowStockController < ApplicationController
  def index
    @products = Product.low_stock
    end
end
