# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Features', type: :feature do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  before(:each) do
    visit '/login'
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    click_link 'My projects'
  end
  context 'feature create' do
    before(:each) do
      visit project_path(project)
      first(:link, '+ Add Feature').click
      select('current', from: 'Panel name')
      select('started', from: 'Status')
    end
    it 'creates new feature' do
      fill_in 'Title', with: Faker::Name.name
      fill_in 'Description', with: Faker::Lorem.paragraph
      click_button 'Save'
      expect(page).to have_content 'new feature added'
    end
    it 'fails to create feature' do
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      click_button 'Save'
      expect(page).to have_content 'Title can\'t be blank'
      expect(page).to have_content 'Description can\'t be blank'
    end
  end
  let(:feature) { create(:feature, project: project) }
  before(:each) do
    visit project_path(project)
    visit project_feature_path(project, feature)
  end
  context 'feature update' do
    before(:each) do
      click_link 'edit'
    end
    it 'updates feature' do
      fill_in 'Title', with: Faker::Name.first_name
      fill_in 'Description', with: Faker::Lorem.paragraph
      click_button 'Save'
      expect(page).to have_content 'feature updated successfully'
    end
    it 'fails to update feature' do
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      click_button 'Save'
      expect(page).to have_content 'Title can\'t be blank'
      expect(page).to have_content 'Description can\'t be blank'
    end
  end

  context 'destroy feature' do
    it 'destroys feature' do
      accept_confirm do
        click_link 'destroy'
      end
      expect(page).to have_content 'Feature was successfully destroyed.'
    end
  end
end
