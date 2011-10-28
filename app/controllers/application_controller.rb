class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def authenticate_admin!
      current_user.admin?
    end
end
