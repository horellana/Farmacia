class AddLaboratoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :laboratory, foreign_key: true
  end
end
