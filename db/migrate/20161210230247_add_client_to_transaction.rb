class AddClientToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :client, foreign_key: true, null: true
  end
end
