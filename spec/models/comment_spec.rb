# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    let(:project) { build(:project, user: user) }
    let(:feature) { build(:feature, project: project) }
    let(:task) { build(:task, feature: feature) }
    let(:comment) { build(:comment, user: user, feature: feature) }
    it 'ensures comment presence' do
      comment.comment = nil
      expect(comment.save).to eq(false)
    end
    it 'saves comment successfully' do
      expect(comment.save).to eq(true)
    end
  end
end
