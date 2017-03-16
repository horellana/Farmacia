class AddProductToPrinciple < ActiveRecord::Migration[5.0]
  def change
    add_reference :principles, :product, foreign_key: true
  end
end
