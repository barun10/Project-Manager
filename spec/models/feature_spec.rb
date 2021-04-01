# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feature, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    let(:project) { build(:project, user: user) }
    let(:feature) { build(:feature, project: project) }
    it 'ensures title presence' do
      feature.title = nil
      expect(feature.save).to eq(false)
    end
    it 'ensures description presence' do
      feature.description = nil
      expect(feature.save).to eq(false)
    end
    it 'ensures panel_name presence' do
      feature.panel_name = nil
      expect(feature.save).to eq(false)
    end
    it 'ensures status presence' do
      feature.status = nil
      expect(feature.save).to eq(false)
    end
    it 'should save feature successfully' do
      expect(feature.save).to eq(true)
    end
  end
end
