class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :http_auth if Rails.env.production?

  protected
    def http_auth
      authenticate_or_request_with_http_digest("Application") do |name|
        {
          "jmoses" => "sesom3"
        }[name]
      end
    end
end
