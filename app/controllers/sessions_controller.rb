class SessionsController < ApplicationController
  
  def new
    if current_user
      redirect_to posts_url
    end
  end
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id if user.present? 
    redirect_to posts_url, notice: t(:signed_in_success_message)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t(:signed_out_success_message)
  end
  
  def failure
    redirect_to root_url, alert: t(:authentication_failed_message)
  end
  
end
