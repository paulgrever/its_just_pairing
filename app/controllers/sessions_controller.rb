class SessionsController < ApplicationController
  skip_before_filter :require_login
  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    session[:next_match] = @user.next_match
    if @user.activated?
      redirect_to dashboard_path
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.update(next_match: session[:next_match])
    session[:user_id] = nil
    redirect_to root_path
  end
end
