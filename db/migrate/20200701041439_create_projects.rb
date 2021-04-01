# frozen_string_literal: true

# Service to download ftp files from the server
class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end
  end
end
