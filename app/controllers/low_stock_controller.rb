class LowStockController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def index
    @products = Product.low_stock
    if @products.length <= 0
      flash.now[:notice] = "Todos los productos estan sobre el stock minimo"
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Bajo stock"   # Excluding ".pdf" extension.
      end
    end
  end
end
