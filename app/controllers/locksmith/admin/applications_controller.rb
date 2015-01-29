require_dependency 'locksmith/application_controller'

module Locksmith
  module Admin
    class ApplicationsController < ApplicationController
      def delete
        @application = Application.find(params[:id])
      end

      def destroy
        application = Application.find(params[:id])
        application.destroy
        flash[:success] = 'The application have been deleted'
        redirect_to admin_user_path(application.user_id)
      end

      def show
        @application = Application.find(params[:id])
      end

      def regenerate
        application = Application.find(params[:id])
        application.regenerate_key
        application.save
        redirect_to show
      end
    end
  end
end
