class ProjectsController < ApplicationController
  before_action :require_login
  def index
      @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
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

  def update
  end

  private

  def project_params
    params.require('project').permit(:name, :user_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
