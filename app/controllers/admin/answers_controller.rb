require 'json'

class Admin::AnswersController < ApplicationController
  before_filter :confirm_admin
  def index
    @answers = Answer.all
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

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to admin_answers_path
  end

  private
    def answer_params
      params.require(:answer).permit(:delta, :question_id, :user_id)
    end
end
