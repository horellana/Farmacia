class AddProductToWastes < ActiveRecord::Migration[5.0]
  def change
    add_reference :wastes, :product, foreign_key: true
  end
end
