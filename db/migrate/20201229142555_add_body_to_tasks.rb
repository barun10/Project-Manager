class AddBodyToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :body, :text
  end
end
