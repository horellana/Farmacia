class AddPaymentMethodToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :payment_method, foreign_key: true
  end
end
