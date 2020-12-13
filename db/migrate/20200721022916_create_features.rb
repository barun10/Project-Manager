class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :title, null: false
      t.string :description
      t.string :panel_name, null: false
      t.integer :ticket_id
      t.string :file
      t.string :status
      t.belongs_to :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
