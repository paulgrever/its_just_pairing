class SessionsController < ApplicationController
  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    if @user.activated?
      redirect_to dashboard_path
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
