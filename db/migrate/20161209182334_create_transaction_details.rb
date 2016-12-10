class CreateTransactionDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_details do |t|
      t.references :transactionn, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :unit_price
      t.integer :net_price
      t.integer :discount
      t.string :return
      t.datetime :update_time

      t.timestamps
    end
  end
end
