class UsersController < ApplicationController

  def new # This is the form view
    @user = User.new
  end

  def create # This happens when user hits the submit button on the form
    @user = User.new(form_params)
    if @user.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def form_params
    params.require(:user).permit(:name, :username,
      :email, :password, :password_confirmation)
  end

end
