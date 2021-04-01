# frozen_string_literal: true

# Service to download ftp files from the server
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :feature, foreign_key: true
      t.text :comment, null: false

      t.timestamps
    end
  end
end
