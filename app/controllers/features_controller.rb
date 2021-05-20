# frozen_string_literal: true

# Service to download ftp files from the server
include SessionsHelper
class FeaturesController < ApplicationController
  before_action :require_login
  before_action :set_project
  before_action :set_feature, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create edit update]
  after_action :feature_status_change, except: %i[destroy]
  before_action :require_authorization, only: %i[show edit update destroy]
  def new
    @feature = @project.features.build
  end

  def create
    @feature = @project.features.build(feature_params)
    @feature.ticket_id = Faker::Bank.account_number(digits: 8)
    @feature.users << User.find(params[:users]) unless params[:users].nil?
    if @feature.save
      redirect_to project_path(@project), flash: { success: 'new feature added' }
    else
      render :new, flash: { error: 'feature not saved' }
    end
  end

  def show
    @task = Task.new
    @tasks = @feature.tasks
    @comment = Comment.new
    @comments = @feature.comments
    @usernames = @feature.users.pluck(:name).to_json.html_safe
  end

  def edit; end

  def update
    @feature.users.clear
    @feature.users << User.find(params[:users]) unless params[:users].nil?
    @old_status = @feature.status
    if @feature.update(feature_params)
      send_feature_status_change_email
      redirect_to project_path(@project), flash: { success: 'feature updated successfully' }
    else
      render :edit
    end
  end

  def destroy
    @feature.destroy
    redirect_to project_path(@project), flash: { notice: 'Feature was successfully destroyed.' }
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

  def set_user
    @users = User.all
  end

  def send_feature_status_change_email
    if @feature.status != @old_status
      @feature.users.each do |user|
        FeatureMailer.with(feature: @feature, user: user).feature_status_updated.deliver_later
      end
    end
  end
  def feature_status_change
    unless @feature.status == "completed" || @feature.status == "delivered"
      if @feature.tasks.completed.count > 0
        @feature.status = "started"
        @feature.save
      end
    end
  end
  def require_login
    redirect_to login_path, flash: { notice: 'please login first' } unless logged_in?
  end
  def require_authorization
    unless (@feature.users.include? current_user) || (current_user == @feature.project.user)
      redirect_to login_path, flash: { danger: 'You are not authorized to access the page' }
    end
  end
end
