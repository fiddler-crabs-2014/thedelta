class UsersController < ApplicationController
  before_action :confirm_logged_in, only: [:profile, :edit, :update]

  def index
    redirect_to root_path
  end


  def new
    if current_user
      flash[:notice] = "You are logged in, no need to create another account"
      redirect_to profile_path
    else
      @user = User.new  
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You successfully created an account'
      redirect_to last_visited_page(params)
    else
      render :new
    end
  end

  def profile
    @user = User.find(session[:user_id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :profile, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def team
    render :team
  end

  private
  
  def user_params
     params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end