class SessionsController < ApplicationController

  def new
    # Nothing else needed because we're
    # not adding anything to a database
  end

  def destroy
    # Log-out by removing session completely with Rails' "reset_session" method
    reset_session

    flash[:success] = "You've logged out!"

    redirect_to root_path
  end

end
