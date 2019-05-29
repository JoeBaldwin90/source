class ApplicationController < ActionController::Base

  # Make current_user method available in views
  helper_method :current_user

  # Run this on every page before any action
  before_action :current_user

  def current_user
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    @current_user # Return something to use
  end



end
