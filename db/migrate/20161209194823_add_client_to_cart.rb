class AddClientToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :client, foreign_key: true
  end
end
