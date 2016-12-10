class CreateTransactionDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_details do |t|
      t.references :transaction, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :unit_price
      t.integer :net_price
      t.string :devolution
      t.references :user, foreign_key: true
      t.integer :discount
      t.datetime :update_time

      t.timestamps
    end
  end
end
