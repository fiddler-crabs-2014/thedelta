 class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 

  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_user, :signed_in?, :current_admin
  before_action :controller, :action

  def signed_in?
    !current_user.nil?
  end

  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    else
      return nil
    end
  end

  def current_admin
    curr_user = current_user
    
    return nil if curr_user.nil?

    if curr_user.admin == true
      return current_user
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

  def confirm_admin

    curr_user = current_user

    if curr_user.nil?
      flash[:notice] = 'You must logged in to to view this page'
      redirect_to login_path
      return false
    end

    if curr_user.admin == true
      return true
    else
      flash[:notice] = 'You must be an admin to view this page'
      redirect_to profile_path
      return false
    end
  end

  private
    def controller
      @controller ||= self.class 
    end

    def action
      @action ||= self.action_name
    end
end
