require 'json'

class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(delta: params[:delta].to_json)#,
                        #user_id: params[:user_id], 
                        #question_id: params[:question_id])

    #if @answer.save
      render json: @answer.delta
    #else
    #  redirect_to new_answer_path
    #end
  end

  private
    def answer_params
      params.require(:answer).permit(:delta,
                                     :question_id,
                                     :category_id,
                                     :user_id)
    end
end
