class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :status

      t.belongs_to :feature, index: true, foreign_key: true
      t.timestamps
    end
  end
end
