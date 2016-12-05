class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :description
      t.references :provider, foreign_key: true
      t.integer :sale_price
      t.integer :purchase_price
      t.string :exempt
      t.integer :commission
      t.references :medicinal_ingredient, foreign_key: true
      t.references :dose, foreign_key: true
      t.string :be
      t.string :isp
      t.references :category, foreign_key: true
      t.integer :discount

      t.shopping_cart_item_fields

      t.timestamps
    end
  end
end
