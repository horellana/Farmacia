class AddPayedAmountToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :payed_amount, :integer
  end
end
