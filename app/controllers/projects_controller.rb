class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
      @projects = Project.all
  end

  def show
    if params[:query]
      @project.features = Feature.where("ticket_id LIKE ?" ,"%#{params[:query]}%").or(Feature.where("title LIKE ?" ,"%#{params[:query]}%"))
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = session[:user_id]
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require('project').permit(:name, :user_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
