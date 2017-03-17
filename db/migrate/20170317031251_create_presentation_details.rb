class CreatePresentationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :presentation_details do |t|
      t.references :presentation, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
