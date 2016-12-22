class RemoveUpdateTimeFromTransactionDetails < ActiveRecord::Migration[5.0]
  def change
    remove_column :transaction_details, :update_time
  end
end
