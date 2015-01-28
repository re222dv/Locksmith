
module Locksmith
  module SessionHelpers
    def create_account(name, email, password, confirmation = nil)
      confirmation = password if confirmation.nil?

      visit locksmith.signup_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Confirmation', with: confirmation
      click_button 'Create account'
    end

    def sign_in(email, password)
      visit locksmith.signin_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
