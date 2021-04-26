# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'new user' do
    it 'renders the new template' do
      get :new
      expect(response).to be_successful
    end
  end
end
