class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.references :subsidiary, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :stock
      t.integer :minimum_stock

      t.timestamps
    end
  end
end
