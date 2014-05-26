class VotesController < ApplicationController

  def vote_up
    
  end

  def vote_down

  end

  private
  
  def user_params
     params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end