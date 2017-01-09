class AddCartToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :cart, foreign_key: true
  end
end
