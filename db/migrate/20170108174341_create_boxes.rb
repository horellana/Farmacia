class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
