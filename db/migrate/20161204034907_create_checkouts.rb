class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.bigint :ticket
      t.boolean :start

      t.timestamps
    end
  end
end
