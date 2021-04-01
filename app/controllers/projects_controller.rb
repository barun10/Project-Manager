# frozen_string_literal: true

# Service to download ftp files from the server
include SessionsHelper
class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: %i[show edit update destroy]
  def index
    @projects = current_user.projects
  end

  def show
    if params[:query]
      @project.features = Feature.where('ticket_id LIKE ?',
                                        "%#{params[:query]}%").or(Feature.where('title LIKE ?', "%#{params[:query]}%"))
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = session[:user_id]
    if @project.save
      redirect_to projects_path, flash: { success: 'Project successfully created.' }
    else
      render :new, flash: { error: 'Project not saved' }
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path, flash: { success: 'Project successfully updated' }
    else
      render :edit, flash: { error: 'Project not updated' }
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, flash: { notice: 'Project successfully destroyed ' }
  end

  private

  def project_params
    params.require('project').permit(:name, :user_id)
  end

  def require_login
    unless logged_in?
      redirect_to login_path, flash: { notice: 'please login first' }
    end
  end

  
  def set_project
    @project = Project.find(params[:id])
  end
end
