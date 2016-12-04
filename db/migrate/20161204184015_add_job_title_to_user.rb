class AddJobTitleToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :job_title, foreign_key: true
  end
end
