require 'rails_helper'

# noinspection RailsParamDefResolve
module Locksmith
  include SessionHelpers

  feature 'Handle applications' do
    fixtures :all

    background do
      sign_in 'Basic@User.com', 'password'
    end

    scenario 'list applications owned by the user' do
      click_link 'My applications'

      expect(page).to have_link 'Narwhal'
      expect(page).to have_link 'Marlin'
      expect(page).not_to have_content 'Elephant'
      expect(page).not_to have_content 'Giraffe'
    end

    scenario 'open an application page' do
      click_link 'Marlin'

      expect(page).to have_content 'Marlin'
      expect(page).to have_content 'bu7nCxqOyHIfo2G1CtO9B7RpaZx+N768/g=='
      expect(page).not_to have_content 'Narwhal'
    end

    scenario 'create an application' do
      click_link 'New application'

      fill_in 'Name', with: 'Stingray'
      click_button 'Create application'
      expect(page.find '.flash.success').to have_content 'Your application have been created'
      expect(current_url).to be == locksmith.application_url(id: 5)
    end

    scenario 'create an application with blank name' do
      click_link 'New application'

      click_button 'Create application'
      expect(page).to have_content 'Name can\'t be blank'
    end

    scenario 'delete an application' do
      click_link 'Marlin'

      click_link 'Delete application'
      click_button 'Yes, I\'m sure'
      expect(current_url).to be == locksmith.root_url
      expect(page).to have_link 'Narwhal'
      expect(page).not_to have_content 'Marlin'
    end

    scenario 'regenerate an API key' do
      click_link 'Marlin'
      click_button 'Regenerate'

      expect(page).to have_content 'Marlin'
      expect(page).not_to have_content 'bu7nCxqOyHIfo2G1CtO9B7RpaZx+N768/g=='
      expect(page).not_to have_content 'Narwhal'
    end
  end
end
