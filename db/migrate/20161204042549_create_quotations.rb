class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.integer :net_amount
      t.float :iva
      t.integer :total
      t.string :transaction_kind
      t.references :checkout, foreign_key: true

      t.timestamps
    end
  end
end
