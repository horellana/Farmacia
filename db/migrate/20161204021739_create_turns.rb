class CreateTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
