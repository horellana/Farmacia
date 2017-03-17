class AddPresentationToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :presentation, foreign_key: true
  end
end
