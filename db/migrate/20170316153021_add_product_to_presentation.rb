class AddProductToPresentation < ActiveRecord::Migration[5.0]
  def change
    add_reference :presentations, :product, foreign_key: true
  end
end
