class TasksController < ApplicationController
  before_action :require_login
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
      @task = Task.new(task_params)
      @task.status = 0
      @task.feature_id = 1
      if @task.save
        flash[:success] = "task successfully created"
        redirect_to tasks_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end 

  private

  def task_params
    params.require('task').permit(:description, :status, :feature_id)
  end
  
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
