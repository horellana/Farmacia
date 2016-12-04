class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :rut
      t.string :name
      t.string :lastname
      t.string :gender
      t.datetime :birth
      t.string :email
      t.string :address
      t.string :kind
      t.string :business_name

      t.timestamps
    end
  end
end
