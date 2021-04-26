# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context 'should get new' do
    it 'renders the login template' do
      get :new
      expect(response).to be_successful
    end
  end
end
