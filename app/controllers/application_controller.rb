# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :login_user

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  private
  def login_user
    return if %w(sessions passwords registrations).include?(params[:controller])
    return unless secure?
    return if user_signed_in?
    redirect_to '/'
  end

  def secure?
    true
  end
end
