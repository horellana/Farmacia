class AddProductIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :products, :name
    add_index :products, :code
  end
end
