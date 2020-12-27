class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @feature = @task.feature
    if @task.save
      redirect_to project_feature_path(@feature.project_id, @task.feature_id)
    else
      redirect_to root_path
    end
  end
  
  def update
    @task = Task.find(params[:id])
    @feature = @task.feature
    if @task.update(task_params)
      redirect_to project_feature_path(@feature.project_id, @task.feature_id)
    else
      redirect_to root_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @feature = @task.feature
    @task.destroy
    redirect_to project_feature_path(@feature.project_id, @task.feature_id)
    flash[:notice] = 'Feature was successfully destroyed.'
  end
  
  private

  def task_params
    params.require('task').permit(:description, :status, :feature_id)
  end
  
end
