# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'GET #index' do
    let(:user) { build(:user) }
    it 'renders the index template' do
      get root_path
      expect(response).to be_successful
    end
  end
end
