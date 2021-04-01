# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'ensures email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end
    it 'ensures password presence' do
      user.password = nil
      expect(user.save).to eq(false)
    end
    it 'should save successfully' do
      expect(user.save).to eq(true)
    end
  end
end
