class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.references :schedule, foreign_key: true 
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
