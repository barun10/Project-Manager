# frozen_string_literal: true

# Service to download ftp files from the server
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false

      t.timestamps
    end
  end
end
