# frozen_string_literal: true

# Service to download ftp files from the server
class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :feature, index: true, foreign_key: true

      t.string :description, null: false
      t.boolean :status
      t.timestamps
    end
  end
end
