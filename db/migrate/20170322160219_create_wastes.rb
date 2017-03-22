class CreateWastes < ActiveRecord::Migration[5.0]
  def change
    create_table :wastes do |t|
      t.integer :amount
      t.text :description
      t.string :motive
      t.datetime :date
      t.references :inventories, foreign_key: true
    end
  end
end
