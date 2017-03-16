class RemoveProductFromPrinciple < ActiveRecord::Migration[5.0]
  def change
    remove_reference :principles, :product, foreign_key: true
  end
end
