# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Project, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }

    let(:project) { build(:project, user: user) }
    it 'ensures name presence' do
      project.name = nil
      expect(project.save).to eq(false)
    end
    it 'saves project successfully' do
      expect(project.save).to eq(true)
    end
  end
end
