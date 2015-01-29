require_dependency 'locksmith/application_controller'

module Locksmith
  module Admin
    class UsersController < AdminController
      def destroy
        @user = User.find params[:id]
        @user.destroy
        redirect_to admin_users_path
      end

      def index
        @users = User.all
      end

      def show
        @user = User.find params[:id]
      end
    end
  end
end
