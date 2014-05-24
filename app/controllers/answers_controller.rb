require 'json'

class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(delta: params[:delta].to_json)
    render json: @answer.delta
  end

  private
    def answer_params
      params.require(:answer).permit(:delta,
                                     :question_id,
                                     :category_id,
                                     :user_id)
    end
end
