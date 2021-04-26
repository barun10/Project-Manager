# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Projects', type: :feature do
  let(:user) { create(:user) }
  before(:each) do
    visit '/login'
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    click_link 'My projects'
  end
  context 'project create' do
    before(:each) do
      click_link 'Add Project +'
    end
    it 'creates new project' do
      fill_in 'Name', with: Faker::Name.name
      click_button 'Save'
      expect(page).to have_content 'Project successfully created'
    end
    it 'does not create new project' do
      fill_in 'Name', with: ''
      click_button 'Save'
      expect(page).to have_content 'Name can\'t be blank'
    end
  end
  let(:project) { create(:project, user: user) }

  context 'project update' do
    it 'successfully updates' do
      visit edit_project_path(project)
      within('form') do
        fill_in 'Name', with: Faker::Name.name
      end
      click_button 'Save'
      expect(page).to have_content 'Project successfully updated'
    end
    it 'does not update' do
      visit edit_project_path(project)
      within('form') do
        fill_in 'Name', with: ''
      end
      click_button 'Save'
      expect(page).to have_content 'Name can\'t be blank'
    end
  end

  context 'destroy project' do
    it 'destroys project' do
      click_link 'Add Project +'
      within('form') do
        fill_in 'Name', with: Faker::Name.name
      end
      click_button 'Save'
      accept_confirm do
        click_link 'destroy'
      end
      expect(page).to have_content 'Project successfully destroyed'
    end
  end
end
