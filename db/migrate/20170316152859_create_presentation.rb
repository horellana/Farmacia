class CreatePresentation < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :name
    end
  end
end
