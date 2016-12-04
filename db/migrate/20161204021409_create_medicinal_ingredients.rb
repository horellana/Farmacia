class CreateMedicinalIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :medicinal_ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end
