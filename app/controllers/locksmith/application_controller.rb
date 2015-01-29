module Locksmith
  class ApplicationController < ActionController::Base
    before_action :validate_logged_in
    protect_from_forgery with: :exception

    include SessionHelper

    private

    # Validates that the user is signed in and redirects to signin form if needed
    def validate_logged_in
      unless signed_in?
        flash[:error] = 'You need to sign in' unless request.path == root_path
        redirect_to signin_path
      end
    end
  end
end
