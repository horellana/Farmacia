class DeleteUserFromTransactionDetail < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :transaction_details, :user
  end
end
