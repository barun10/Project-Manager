class FeaturesController < ApplicationController
  before_action :set_project
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  def new
    @feature = @project.features.build
  end
  
  def create
    @feature = @project.features.build(feature_params)
    @feature.ticket_id = Integer(rand.to_s[2..9])
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
  end

  def edit
  end

  def update
    if @feature.update()
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
    params.require('feature').permit(:title, :description, :panel_name, :project_id, :file, :status, :current_user)
  end
  
  def set_feature
    @feature = @project.features.find(params[:id])
  end
  
  def set_project
    @project = Project.find(params[:project_id])
  end
end
