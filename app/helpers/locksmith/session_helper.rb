module Locksmith
  module SessionHelper
    # Returns the current signed-in user, nil if no user is signed in
    def current_user
      @current_user ||= User.find_by id: session[:user_id]
    end

    # Returns true if a user is signed in, false otherwise.
    def signed_in?
      current_user.present?
    end

    # Signs in the given user.
    def sign_in(user)
      session[:user_id] = user.id
    end

    # Signs out the current user.
    def sign_out
      session.delete :user_id
      @current_user = nil
    end
  end
end
