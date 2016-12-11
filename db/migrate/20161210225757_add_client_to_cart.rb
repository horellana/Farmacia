class AddClientToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :client, foreign_key: true, null: true
  end
end
