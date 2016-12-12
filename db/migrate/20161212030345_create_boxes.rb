class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.boolean :active
      t.string :description
      t.references :subsidiary, foreign_key: true

      t.timestamps
    end
  end
end
