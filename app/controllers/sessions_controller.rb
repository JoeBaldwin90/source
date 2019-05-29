class SessionsController < ApplicationController


  def destroy
    # Log-out by removing session completely with Rails' "reset_session" method
    reset_session

    flash[:success] = "You've logged out!"

    redirect_to root_path
  end

end
