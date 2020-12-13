class AddCurrentUsertoFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :current_user, :string
  end
end
