class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :title
      t.string :description
      t.string :panel_name
      t.integer :ticket_id
      t.belongs_to :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
