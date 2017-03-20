class RemoveMinimumStockFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :minimum_stock
  end
end
