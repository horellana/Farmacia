class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.all
    if @inventories.length <= 0
      flash[:notice] = "No hay productos en el inventario"
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "inventario"   # Excluding ".pdf" extension.
      end
    end
  end
end
