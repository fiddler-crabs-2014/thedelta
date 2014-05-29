class VotesController < ApplicationController

  def record
    @answer = Answer.find(params[:answer_id])
    record_vote = Vote.record_vote(session[:user_id], 
    params[:answer_id], params[:vote_value])

    if params[:question_id]
      respond_to do |format|
        format.html { redirect_to question_path(params[:question_id]) }
        format.json {render json: {text: "#{@answer.upvote_count} Up | #{@answer.downvote_count} Down", id: "#vote-result-" + params[:answer_id] } }
      end
    else
      respond_to do |format|
        format.html { redirect_to answer_path(@answer) }
        format.json {render json: {text: "#{@answer.upvote_count} Up | #{@answer.downvote_count} Down", id: "#vote-result-" + params[:answer_id] } }
      end
    end
  end

  private
  
  def user_params
     params.require(:vote).permit(:user_id, :answer_id, :vote_value, :question_id)
  end

end