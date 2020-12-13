class Createfeaturesusers < ActiveRecord::Migration[5.2]
  def change
    create_table :features_users, id: false do |t|
      t.belongs_to :feature
      t.belongs_to :user
    end
  end
end
