require_dependency 'locksmith/application_controller'

module Locksmith
  class UsersController < ApplicationController
    skip_before_action :validate_logged_in, only: [:create, :new]
    before_action :validate_guest

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success] = 'Your account have been created'
        redirect_to root_path
      else
        render 'new'
      end
    end

    def new
      @user = User.new
    end

    private

    def validate_guest
      redirect_to root_path if signed_in?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
