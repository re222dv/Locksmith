require_dependency 'locksmith/application_controller'

module Locksmith
  module Admin
    class AdminController < ApplicationController
      before_action :validate_admin

      private

      def validate_admin
        unless admin?
          flash[:error] = 'You don\'t have access to that page'
          redirect_to root_path
        end
      end
    end
  end
end
