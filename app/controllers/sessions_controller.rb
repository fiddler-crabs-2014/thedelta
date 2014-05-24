class SessionsController < ApplicationController

  def login

  end

  def attempt_login

    if params[:email_username].present? && params[:password].present?
      #user can login using either email or username
      if params[:email_username].include?("@")
        found_user = User.where(email: params[:email_username]).first
      else
        found_user = User.where(username: params[:email_username]).first
      end
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = 'You are logged in'
      redirect_to profile_path
    else
      session.clear
      flash[:notice] = "Invalid email / password combination"
      redirect_to :login
    end

  end

  def logout
    session.clear
    flash[:notice] = 'You are logged out'
    redirect_to :login
  end

end