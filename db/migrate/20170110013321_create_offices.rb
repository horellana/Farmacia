class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.integer :phone
      t.string :sii_code
      t.text :description

      t.timestamps
    end
  end
end
