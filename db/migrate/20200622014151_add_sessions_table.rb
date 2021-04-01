# frozen_string_literal: true

# Service to download ftp files from the server
class AddSessionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :session_id, null: false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id, unique: true
    add_index :sessions, :updated_at
  end
end
