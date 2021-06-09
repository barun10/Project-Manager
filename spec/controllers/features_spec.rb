# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do
  context 'GET #show' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }
    let(:feature) { create(:feature, project: project) }

    it 'renders a successful response' do
      allow(controller).to receive(:current_user).and_return(user)
      get :show, params: { id: feature.to_param, project_id: project.to_param }
      expect(response).to be_successful
    end
  end
end
