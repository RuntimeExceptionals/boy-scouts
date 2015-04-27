class ApplicationController < ActionController::Base
  include Clearance::Controller
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Provide a catch-all fallback from access denied errors
  # as a result of incorrect permissions through cancancan.
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to main_app.root_path, :alert => exception.message
  end
end
