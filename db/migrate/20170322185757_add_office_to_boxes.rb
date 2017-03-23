class AddOfficeToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_reference :boxes, :office, foreign_key: true
  end
end
