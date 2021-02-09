class FeaturesController < ApplicationController
  before_action :set_project
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  def new
    @feature = @project.features.build
    @users = User.all
  end
  
  def create
    @feature = @project.features.build(feature_params)
    @feature.ticket_id = Integer(rand.to_s[2..9])
    @feature.users << User.find(params[:users]) unless params[:users].nil?
    if @feature.save
      redirect_to project_path(@project)
    else
      flash[:error] = "no save"
      render :new
    end
  end

  def show
    @task = Task.new
    @tasks = @feature.tasks
    @comment = Comment.new
    @comments = @feature.comments
    @usernames = @feature.users.pluck(:name).to_json.html_safe
  end

  def edit
    @users = User.all
  end

  def update
    @feature.users.clear
    @feature.users << User.find(params[:users]) unless params[:users].nil?

    @old_status = @feature.status
    if @feature.update(feature_params)
      send_feature_status_change_email
      flash[:success] = "feature updated successfully"
      redirect_to project_path(@project)
    else
      render :edit
    end
      
  end
    
  def destroy
    @feature.destroy
    redirect_to project_path(@project)
    flash[:notice] = 'Feature was successfully destroyed.'
  end

  private

  def feature_params
    params.require('feature').permit(:title, :description, :panel_name, :project_id, :file, :status)
  end
  
  def set_feature
    @feature = @project.features.find(params[:id])
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end

  def send_feature_status_change_email
    if @feature.status != @old_status
      @feature.users.each  do |user|
        FeatureMailer.with(feature: @feature, user: user).feature_status_updated.deliver_later
      end
    end
  end
  
end
