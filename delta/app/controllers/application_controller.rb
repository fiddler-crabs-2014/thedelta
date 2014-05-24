class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_user, :signed_in?

  def signed_in?
    !current_user.nil?
  end

  # def current_user=(user)
  #   @current_user = user
  # end

  def current_user
    # @current_user ||= User.find_by(session[:user_id])
    if session[:user_id].present?
      User.find(session[:user_id])
    else
      return nil
    end
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    session.clear
    self.current_user = nil
  end

  def signed_in_user
    unless signed_in?
      flash[:notice] = "Please sign in."
      redirect_to login_path
    end
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = 'Please log in'
      redirect_to login_path
      return false
    else
      return true
    end
  end
end
