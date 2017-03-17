class AddAddressToOffices < ActiveRecord::Migration[5.0]
  def change
    add_column :offices, :address, :string
    add_column :offices, :hour_in, :datetime
    add_column :offices, :hour_out, :datetime
  end
end
