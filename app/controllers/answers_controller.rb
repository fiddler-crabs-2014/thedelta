require 'json'

class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question])
    @answer = Answer.create(question_id: @question.id, user_id: current_user.id)
    p "AT ANSWER"
    p @answer
  end

  def create
    p "CURRENT USER:"
    p current_user
    p "CURRENT SESSION:"
    p session
    p params[:delta]
    p "AT ANSWER"

    ## This logic needs to be fixed.
    @answer = Answer.last
    if params[:delta]
      @answer.update_attributes(delta: params[:delta].to_json)#,
      render json: @answer.question_id
    elsif JSON.parse(params[:delta].to_json) == ["0"]
      @answer.destroy
    end                   #user_id: current_user.id, 
                        #question_id: params[:answer][:question_id])

    #if @answer.save
      # render json: @answer.delta
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
