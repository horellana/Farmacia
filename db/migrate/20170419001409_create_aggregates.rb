class CreateAggregates < ActiveRecord::Migration[5.0]
  def change
    create_table :aggregates do |t|
      t.integer :stock
      t.timestamps
    end
  end
end
