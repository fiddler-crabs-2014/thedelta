class BaseAnswerController < ApplicationController
	
	def create
	  if params[:delta].present? && params[:delta].length >1
	    @answer = Answer.new(delta: params[:delta].to_json, user_id: current_user.id, question_id: params[:question_id]) 
	    if @answer.save
	      render json: { question_id: @answer.question_id }.to_json
	    else
	      @answer.errors.full_messages
	      redirect_to new_answer_path
	    end
	  else
	    flash[:notice] = "That was not a valid Answer."
	    redirect_to new_answer_path(question: params[:question_id])
	  end
	end

	def show
    @answer = Answer.find(params[:id])
  end


  private
  def answer_params
    params.require(:answer).permit(:delta, :question_id, :user_id)
  end

end