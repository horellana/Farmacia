class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.references :transaction, foreign_key: true
      t.references :payment_method, foreign_key: true
    end
  end
end
