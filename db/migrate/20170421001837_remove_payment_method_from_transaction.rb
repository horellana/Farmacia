class RemovePaymentMethodFromTransaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :payment_method_id
  end
end
