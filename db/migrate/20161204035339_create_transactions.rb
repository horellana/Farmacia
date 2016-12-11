class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :kind
      t.datetime :date
      t.integer :net_amount
      t.float :iva
      t.integer :discount
      t.integer :total_amount

      t.timestamps
    end
  end
end
