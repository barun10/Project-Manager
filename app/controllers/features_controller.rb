class FeaturesController < ApplicationController
    def new
      @feature = Feature.new
    end
  
    def create
      @feature = Feature.new(feature_params)
      @feature.ticket_id = Integer(rand.to_s[2..9])
      if @feature.save
        redirect_to projects_path
      else
        flash[:error] = "no save"
        render :new
      end
    end
    
    private

    def feature_params
      params.require('feature').permit(:title, :description, :panel_name, :project_id, :file, :status)
    end
end
