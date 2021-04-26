# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:user) { create(:user) }
  context 'the sign-in process' do
    before(:each) do
      visit '/login'
    end
    it 'signs me in' do
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'You have successfully logged in'
    end
    it 'gives login error' do
      within('form') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid email/password combination'
    end
  end
  context 'the signout' do
    it 'signs out' do
      visit '/login'
      within('form') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      visit root_path
      click_link 'Log out'
      expect(page).to have_link 'Sign up'
    end
  end
end
