# frozen_string_literal: true

# Service to download ftp files from the server
class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.belongs_to :project, index: true, foreign_key: true

      t.string :title, null: false
      t.string :description, null: false
      t.string :panel_name
      t.integer :ticket_id, null: false, unique: true
      t.string :file
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
