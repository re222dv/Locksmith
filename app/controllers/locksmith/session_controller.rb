require_dependency 'locksmith/application_controller'

module Locksmith
  class SessionController < ApplicationController
    skip_before_action :validate_logged_in, only: [:create, :new]
    before_action :validate_guest, only: [:create, :new]

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        flash[:success] = 'You have successfully signed in'
        redirect_to root_path
      else
        flash.now[:error] = 'Invalid email and password combination'
        render 'new'
      end
    end

    def destroy
      reset_session
      sign_out
      flash[:success] = 'You have successfully signed out'
      redirect_to signin_path
    end

    def new
      # Just show view
    end

    private

    def validate_guest
      redirect_to root_path if signed_in?
    end
  end
end
