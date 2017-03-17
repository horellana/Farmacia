class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
    if @inventories.length <= 0
      flash[:notice] = "No hay productos en el inventario"
    end
  end
end
