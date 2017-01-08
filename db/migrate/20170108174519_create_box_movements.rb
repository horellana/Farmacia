class CreateBoxMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :box_movements do |t|
      t.references :box, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :start_date
      t.integer :start_amount
      t.datetime :end_date
      t.integer :end_amount

      t.timestamps
    end
  end
end
