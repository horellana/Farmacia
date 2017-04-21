class AddTransactionToPaymentMethod < ActiveRecord::Migration[5.0]
  def change
    add_reference :payment_methods, :transaction, foreign_key: true
  end
end
