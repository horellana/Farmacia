class CreatePrinciples < ActiveRecord::Migration[5.0]
  def change
    create_table :principles do |t|
      t.string :name
    end
  end
end
