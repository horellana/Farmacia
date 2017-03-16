class CreatePrincipleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :principle_details do |t|
      t.references :principle, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
