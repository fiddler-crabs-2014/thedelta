class UsersController < ApplicationController
  before_action :confirm_logged_in, only: [:profile, :edit, :update]


  def new
    if current_user
      flash[:notice] = "You are logged in, no need to create another account"
      redirect_to profile_path
    end
    @user = User.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @user }
    # end
  end

  def create
    @user = User.new(user_params)

    # if params[:password] != params[:password_confirmation]
    #   flash[:notice] = 'Passwords did not match'
    #   render :new
    # end

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You successfullly created an account'

      if params[:referer_url]
        redirect_to params[:referer_url]
      else
        redirect_to profile_path
      end
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

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to :profile, notice: 'User was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def user_params
     params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end