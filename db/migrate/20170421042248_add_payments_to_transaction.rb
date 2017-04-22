class AddPaymentsToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :payments, foreign_key: true
  end
end
