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
      this_session = Session.new
      this_session.user = authorized_user
      this_session.login = DateTime.now
      this_session.save

      session[:user_id] = authorized_user.id
      session[:user_session_id] = this_session.id
      flash[:notice] = 'You are logged in'
      redirect_to courses_path
    else
      session.clear
      flash[:notice] = "Invalid email / password combination"
      redirect_to :login
    end

  end

  def logout
    this_session = Session.find(session[:user_session_id])
    if this_session
      this_session.logout = DateTime.now
      this_session.save
    end
    session.clear
    flash[:notice] = 'You are logged out'
    redirect_to :login
  end

end