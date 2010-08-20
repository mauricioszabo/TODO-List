# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :login_user

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  def login_user
    return if %w(sessions passwords registrations).include?(params[:controller])
    return if user_signed_in?
    redirect_to new_user_registration_path
  end
end
