class SessionsController < ApplicationController

  def login  
    if current_user
      redirect_to profile_path
    end
  end

  def attempt_login
    user = User.find_user_by_email_or_username(params[:email_username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Successfully logged in'
      redirect_to last_visited_page(params)
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