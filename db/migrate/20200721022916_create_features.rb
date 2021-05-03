# frozen_string_literal: true

# Service to download ftp files from the server
class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.belongs_to :project, index: true, foreign_key: true

      t.string :title, null: false
      t.string :description, null: false
      t.integer :panel_name, null: false, default: 0
      t.integer :ticket_id, null: false, unique: true
      t.string :file, default: ' '
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
