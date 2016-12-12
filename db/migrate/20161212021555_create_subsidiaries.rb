class CreateSubsidiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :subsidiaries do |t|
      t.references :commune
      t.string :address
      t.string :phone
      t.string :sii_code
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
