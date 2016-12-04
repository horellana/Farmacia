class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.integer :kind
      t.string :quantity

      t.timestamps
    end
  end
end
