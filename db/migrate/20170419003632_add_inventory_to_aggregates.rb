class AddInventoryToAggregates < ActiveRecord::Migration[5.0]
  def change
    add_reference :aggregates, :inventory, foreign_key: true
  end
end
