# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { build(:user) }
  let(:project) { build(:project, user: user) }
  let(:feature) { build(:feature, project: project) }
  context 'validation tests' do
    let(:task) { build(:task, feature: feature) }
    it 'ensures description presence' do
      task.description = nil
      expect(task.save).to eq(false)
    end
    it 'should save task successfully' do
      expect(task.save).to eq(true)
    end
  end
  context 'scope tests' do
    let(:tasks) { create_list :task, 3, feature: feature }
    before(:each) do
      tasks.last(2).map { |t| t.update(status: true) }
    end

    it 'should return completed tasks' do
      expect(Task.completed.size).to eq(2)
    end
  end
end
