class Admin::UsersController < ApplicationController
  before_action :confirm_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :profile, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def profile
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end



  private
  
  def user_params
     params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end