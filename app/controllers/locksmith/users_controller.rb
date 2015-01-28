require_dependency 'locksmith/application_controller'

module Locksmith
  class UsersController < ApplicationController
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

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
