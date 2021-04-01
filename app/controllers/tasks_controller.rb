# frozen_string_literal: true

# Service to download ftp files from the server
class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]
  before_action :set_feature, only: %i[update destroy]
  def create
    @task = Task.new(task_params)
    set_feature
    flash[:success] = 'new task added' if @task.save
    redirect_to project_feature_path(@feature.project_id, @task.feature_id)
  end

  def update
    flash[:success] = 'task updated' if @task.update(task_params)
    redirect_to project_feature_path(@feature.project_id, @task.feature_id)
  end

  def destroy
    @task.destroy
    redirect_to project_feature_path(@feature.project_id, @task.feature_id),
                flash: { notice: 'task destroyed successfully' }
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_feature
    @feature = @task.feature
  end

  def task_params
    params.require('task').permit(:description, :status, :feature_id)
  end
end
