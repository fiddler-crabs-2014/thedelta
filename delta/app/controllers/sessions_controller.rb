class SessionsController < ApplicationController

  def login

  end

  def admin

  end

  def attempt_login

    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
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