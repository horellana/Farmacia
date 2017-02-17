class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.string :kind
      t.integer :quantity

      t.timestamps
    end
  end
end