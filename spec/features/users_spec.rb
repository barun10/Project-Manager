# frozen_string_literal: true

# # frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create new user' do
    before(:each) do
      visit new_user_path
      within('form') do
        fill_in 'Name',	with: Faker::Name.name
        fill_in 'Email',	with: Faker::Internet.email
        fill_in 'Password',	with: Faker::Internet.password
      end
    end

    scenario 'should be successful' do
      click_button 'Sign up'
      expect(page).to have_content('You have successfully signed up')
    end

    scenario 'should fail' do
      fill_in 'Name',	with: ''
      click_button 'Sign up'
      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'should fail' do
      fill_in 'Email',	with: ''
      click_button 'Sign up'
      expect(page).to have_content('Email can\'t be blank')
    end

    scenario 'should fail' do
      fill_in 'Password',	with: ''
      click_button 'Sign up'
      expect(page).to have_content('Password can\'t be blank')
    end
  end
end
