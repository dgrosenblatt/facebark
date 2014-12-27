class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if Time.now - user.created_at < 10
      redirect_to edit_user_path user
    else
      redirect_to user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
