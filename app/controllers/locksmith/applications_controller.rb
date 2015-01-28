require_dependency 'locksmith/application_controller'

module Locksmith
  class ApplicationsController < ApplicationController
    def create
      @application = Application.new(name: params[:application][:name], user: current_user)
      if @application.save
        flash[:success] = 'Your application have been created'
        redirect_to application_path(@application)
      else
        render 'new'
      end
    end

    def delete
      @application = Application.find(params[:id])
    end

    def destroy
      Application.destroy(params[:id])
      flash[:success] = 'Your application have been deleted'
      redirect_to root_path
    end

    def index
      @applications = Application.where(user: current_user)
    end

    def new
      @application = Application.new
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

    private

    def application_params
      params.require(:application).permit(:name)
    end
  end
end
