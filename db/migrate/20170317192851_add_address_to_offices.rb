class AddAddressToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :address, :string
    add_column :offices, :hour_in, :time
    add_column :offices, :hour_out, :time
  end
end
