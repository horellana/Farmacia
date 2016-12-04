class AddRutToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rut, :string
  end
end
