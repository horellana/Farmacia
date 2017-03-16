class RemoveCommissionFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :commission, :integer
    remove_column :products, :exempt, :string
  end
end
