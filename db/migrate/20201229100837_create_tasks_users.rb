class CreateTasksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_users, :id => false do |t|
      t.belongs_to :task
      t.belongs_to :user
    end
  end
end
