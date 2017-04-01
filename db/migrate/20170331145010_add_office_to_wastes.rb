class AddOfficeToWastes < ActiveRecord::Migration[5.0]
  def change
    add_reference :wastes, :office, foreign_key: true
  end
end
