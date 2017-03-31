class AddInventoryToWastes < ActiveRecord::Migration[5.0]
  def change
    add_reference :wastes, :inventory, foreign_key: true
  end
end
