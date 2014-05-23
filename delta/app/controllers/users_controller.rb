class UsersController < ApplicationController

  def new
    @user = User.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @user }
    # end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to :profile, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(session[:user_id])
  end

  private

  def user_params
     params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end