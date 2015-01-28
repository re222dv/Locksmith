require 'rails_helper'

# noinspection RailsParamDefResolve
module Locksmith
  include SessionHelpers

  feature 'Sign in' do
    fixtures :locksmith_users

    scenario 'look at form' do
      visit locksmith.signin_path

      expect(page).not_to have_button 'Sign out'
      expect(page).to have_button 'Sign in'
      expect(page).to have_link 'Sign up now!'
    end

    scenario 'with valid email and password' do
      sign_in 'Basic@User.com', 'password'

      expect(page.find '.flash.success').to have_content 'You have successfully signed in'
      expect(page).to have_button 'Sign out'
      expect(page).not_to have_button 'Sign in'

      visit locksmith.signin_path
      expect(page).not_to have_content 'You have successfully signed in'
      expect(page).to have_button 'Sign out'
    end

    scenario 'with blank fields' do
      sign_in '', ''

      expect(page.find '.flash.error').to have_content 'Invalid email and password combination'
      expect(page).to have_button('Sign in')
      expect(page).not_to have_button 'Sign out'
    end

    scenario 'with invalid email' do
      sign_in 'invalid@user.com', 'password'

      expect(page.find '.flash.error').to have_content 'Invalid email and password combination'
      expect(page).to have_button 'Sign in'
      expect(page).not_to have_button 'Sign out'

      visit locksmith.signin_path
      expect(page).not_to have_content 'Invalid email and password combination'
      expect(page).to have_button 'Sign in'
      expect(page).not_to have_button 'Sign out'
    end

    scenario 'with blank password' do
      sign_in 'basic@user.com', ''

      expect(page.find '.flash.error').to have_content 'Invalid email and password combination'
      expect(page).to have_button 'Sign in'
      expect(page).not_to have_button 'Sign out'
    end

    scenario 'with invalid password' do
      sign_in 'basic@user.com', 'invalid password'

      expect(page.find '.flash.error').to have_content 'Invalid email and password combination'
      expect(page).to have_button 'Sign in'
      expect(page).not_to have_button 'Sign out'
    end
  end

  feature 'Sign out' do
    background do
      sign_in 'basic@user.com', 'password'
    end

    scenario 'Sign out' do
      click_button 'Sign out'

      expect(page.find '.flash.success').to have_content 'You have successfully signed out'
      click_button 'Sign in'

      expect(page.find '.flash.error').to have_content 'Invalid email and password combination'
      expect(page).to have_button 'Sign in'
      expect(page).not_to have_css '.flash.success'
      expect(page).not_to have_button 'Sign out'
    end
  end
end
