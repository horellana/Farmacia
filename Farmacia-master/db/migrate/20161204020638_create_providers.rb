class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :rut
      t.string :name
      t.string :business_name
      t.string :draft
      t.string :address
      t.string :phone_one
      t.string :phone_two
      t.string :email
      t.string :web
      t.string :kind
      t.string :observation

      t.timestamps
    end
  end
end
