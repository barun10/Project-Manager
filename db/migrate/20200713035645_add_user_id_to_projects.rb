class AddUserIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :user_id, :int
  end
end
