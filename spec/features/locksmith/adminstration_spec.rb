require 'rails_helper'

# noinspection RailsParamDefResolve
module Locksmith
  include SessionHelpers

  feature 'Administration' do
    fixtures :all

    background do
      sign_in 'admin@User.com', 'password'
    end

    scenario 'sign in as a basic user' do
      click_button 'Sign out'
      sign_in 'normal@User.com', 'password'

      expect(page).not_to have_link 'Users'
    end

    scenario 'sign in as an administrator' do
      expect(page).to have_link 'Users'
    end

    scenario 'view all users' do
      click_link 'Users'

      expect(page).to have_link 'Anna'
      expect(page).to have_link 'Edwin'
    end

    scenario 'view a user' do
      click_link 'Users'
      click_link 'Anna'

      expect(page).to have_content 'Anna'
      expect(page).to have_link 'Narwhal'
      expect(page).to have_link 'Marlin'
    end

    scenario 'delete a user' do
      click_link 'Users'
      click_link 'Anna'
      click_button 'Delete user'

      expect(page).not_to have_link 'Anna'
      expect(page).to have_link 'Edwin'
    end

    scenario 'delete an application' do
      click_link 'Users'
      click_link 'Anna'
      click_link 'Narwhal'

      click_link 'Delete application'
      click_button 'Yes, I\'m sure'

      expect(page).to have_content 'Anna'
      expect(page).not_to have_link 'Narwhal'
      expect(page).to have_link 'Marlin'
    end

    scenario 'repent deleting an application' do
      click_link 'Users'
      click_link 'Anna'
      click_link 'Narwhal'

      click_link 'Delete application'
      click_link 'No, go back'

      expect(page).to have_content 'Narwhal'
      expect(page).to have_content 'Key'
      expect(current_url).to be == locksmith.admin_application_url(1)
    end

    scenario 'regenerate an API key' do
      click_link 'Users'
      click_link 'Anna'
      click_link 'Marlin'

      click_button 'Regenerate'

      expect(page).to have_content 'Marlin'
      expect(page).not_to have_content 'bu7nCxqOyHIfo2G1CtO9B7RpaZx+N768/g=='
      expect(page).not_to have_content 'Narwhal'
    end
  end
end
