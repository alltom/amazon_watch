class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :verify_access
  
  def verify_access
    authenticate_or_request_with_http_basic("App Realm") do |username, password|
      if ENV["APP_USER"] && ENV["APP_SECRET"]
        ENV["APP_USER"] == username && ENV["APP_SECRET"] == password
      else
        false
      end
    end
  end
end
