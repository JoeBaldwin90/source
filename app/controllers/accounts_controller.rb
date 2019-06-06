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

  def destroy
    # Remove subscription, then delete user.
    @current_user.unsubscribe_and_destroy

    # Remove session
    reset_session

    flash[:success] = "Your account has been deleted. Goodbye, friend."

    redirect_to root_path
  end

  def form_params
    params.require(:user).permit(:subscription_plan)
  end

end
