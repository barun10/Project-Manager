class CreateUsersAndFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :users_and_features, id: false do |t|
      t.belongs_to :user
      t.belongs_to :feature
    end
  end
end
