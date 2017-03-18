class AddPrincipleIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :principles, :name
  end
end
