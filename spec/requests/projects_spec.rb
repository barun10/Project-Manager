# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :request do
  def current_user
    @current_user = user
  end
  context 'GET #index'do
    let(:user) { build(:user) }
    let(:project) { build(:project, user: user) }
    it 'renders a successful response' do
      allow(controller).to receive(:current_user).and_return(user)
      project.save
      get projects_url
      expect(response).to be_successful
    end
  end
end
