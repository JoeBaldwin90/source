class ApplicationController < ActionController::Base

  # Make these methods available in views
  helper_method :current_user, :is_logged_in?

  # Run this on every page before any action
  before_action :current_user

  def current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    @current_user # Return something to use
  end

  def is_logged_in?
    session[:user_id].present?
  end

end
