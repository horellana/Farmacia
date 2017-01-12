class AddBoxMovementToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :box_movement, foreign_key: true
  end
end
