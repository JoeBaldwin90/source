class SessionsController < ApplicationController

  def new
    # Nothing else needed because we're
    # not adding anything to a database
  end

  def create
    # Pull username and password from the form form data
    @username = form_params[:username]
    @password = form_params[:password]

    # Check user's credentials
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # If user exists, redirect to homepage.
    if @user.present?
      session[:user_id] = @user.id # Save this session to user id
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash[:error] = "Wrong username and/or password"
      render "new"
    end
  end

  def destroy
    # Log-out by removing session completely with Rails' "reset_session" method
    reset_session

    flash[:success] = "You've logged out!"

    redirect_to root_path
  end

  def form_params
    params.require(:session).permit(:username, :password)
  end

end
