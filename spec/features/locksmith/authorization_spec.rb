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
      expect(page).not_to have_button 'Sign in'
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

  feature 'Security' do
    scenario 'Visit my applications without signing in' do
      visit locksmith.root_path

      expect(current_url).to be == locksmith.signin_url
    end

    scenario 'Visit create application page without signing in' do
      visit locksmith.new_application_path

      expect(current_url).to be == locksmith.signin_url
      expect(page.find '.flash.error').to have_content 'You need to sign in'
    end

    scenario 'Visit an administration page without signing in' do
      visit locksmith.admin_users_path

      expect(current_url).to be == locksmith.signin_url
      expect(page.find '.flash.error').to have_content 'You need to sign in'
    end

    scenario 'Visit an administration page as a normal user' do
      sign_in 'Basic@User.com', 'password'

      visit locksmith.admin_users_path

      expect(current_url).to be == locksmith.root_url
      expect(page.find '.flash.error').to have_content 'You don\'t have access to that page'
    end
  end
end
