class VotesController < ApplicationController

  def record
    puts '*' * 50
    puts params
    puts '*' * 50

    @answer = Answer.find(params[:answer_id])
    record_vote = Vote.first_or_create(answer_id: params[:answer_id], user_id: params[:user_id])
    record_vote.vote_value =  params[:vote_value]
    record_vote.save

    redirect_to question_path(@answer.question)
  end

  def vote_down

  end

  private
  
  def user_params
     params.require(:vote).permit(:user_id, :answer_id, :vote_value)
  end

end