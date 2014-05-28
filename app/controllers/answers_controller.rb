require 'json'

class AnswersController < ApplicationController

  def new
    if current_user && params[:question]
      @question = Question.find(params[:question])
      @answer = Answer.new     
    else
      redirect_to login_path
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    if !params[:delta].nil? && params[:delta].length >1
      @answer = Answer.new(delta: params[:delta].to_json, user_id: params[:user_id], question_id: params[:question_id]) 
      if @answer.valid?
        @answer.save
        render json: { question_id: @answer.question_id }.to_json
      else
        @answer.errors.full_messages
      end
    else
      flash[:notice] = "That was not a valid Answer."
      redirect_to new_answer_path(question: params[:question_id])
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:delta, :question_id, :user_id)
    end

end
