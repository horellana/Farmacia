class CreateCommunes < ActiveRecord::Migration[5.0]
  def change
    create_table :communes do |t|
      t.references :cities, foreign_key: true
      t.string :name
    end
  end
end
