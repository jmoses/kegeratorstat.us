class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def authenticate_admin!
      unless current_user.admin?
        redirect_to '/' and return false
      end
    end
end
