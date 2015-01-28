require 'rails_helper'

module Locksmith
  include SessionHelpers

  feature 'Create new account' do
    scenario 'look at form' do
      visit locksmith.signup_path

      expect(page).not_to have_button 'Sign out'
      expect(page).not_to have_button 'Sign in'
      expect(page).to have_link 'Sign in instead'
      expect(page).to have_button 'Create account'
    end

    scenario 'with valid name, email and password' do
      create_account 'Some Name', 'valid@example.com', 'password'

      expect(page).to have_content 'Your account have been created'
      expect(page).to have_button 'Sign out'
    end

    scenario 'with blank name' do
      create_account '', 'valid@example.com', 'password'

      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_button 'Create account'
    end

    scenario 'with invalid email' do
      create_account 'Some Name', 'invalid_email', 'password'

      expect(page).to have_content 'Email must be valid'
      expect(page).to have_button 'Create account'
    end

    scenario 'with blank password' do
      create_account 'Some Name', 'valid@example.com', ''

      expect(page).to have_content 'Password can\'t be blank'
      expect(page).to have_button 'Create account'
    end

    scenario 'with invalid password confirmation' do
      create_account 'Some Name', 'valid@example.com', 'password', 'password2'

      expect(page).to have_content 'Confirmation doesn\'t match Password'
      expect(page).to have_button 'Create account'
    end

    scenario 'with multiple errors' do
      create_account '', 'invalid_email', ''

      expect(page).to have_content 'Name can\'t be blank'
      expect(page).to have_content 'Email must be valid'
      expect(page).to have_content 'Password can\'t be blank'
      expect(page).to have_button 'Create account'
    end
  end
end
