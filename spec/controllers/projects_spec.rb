# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  before(:each) do
    allow(controller).to receive(:current_user).and_return(user)
  end
  context 'GET #index' do
    it 'renders a successful response' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  context 'GET #show' do
    it 'renders a successful response' do
      get :show, params: { id: project.to_param }
      expect(response).to be_successful
    end
  end
end
