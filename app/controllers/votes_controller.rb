class VotesController < ApplicationController

  def record

    @answer = Answer.find(params[:answer_id])
    record_vote = Vote.record_vote(session[:user_id], 
      params[:answer_id], params[:vote_value])

    
    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml => @post }
      format.json {render json: {text: "#{@answer.upvote_count} Up / #{@answer.downvote_count} Down", id: "#vote-result-" + params[:answer_id] } }

    end

  end

  private
  
  def user_params
     params.require(:vote).permit(:user_id, :answer_id, :vote_value)
  end

end