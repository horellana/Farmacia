class AddTransactionToCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :transaction, foreign_key: true
  end
end
