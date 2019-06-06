class AccountsController < ApplicationController

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user

    if @user.update_with_stripe(form_params)
      flash[:success] = "Your account details have been updated"
      redirect_to root_path
    else
      render "edit"
    end

  end

  def form_params
    params.require(:user).permit(:subscription_plan)
  end

end
