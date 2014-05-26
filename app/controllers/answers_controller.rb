require 'json'

class AnswersController < ApplicationController
  def new
    if current_user && params[:question]
      @question = Question.find(params[:question])
      @answer = Answer.create(question_id: @question.id, user_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def create

    ## This logic needs to be fixed.
    ## Figure out how to validate saving an answer in one operation.
    ## The user id and question id is being saved in #new but the delta is saved below
    ## this is a problem with the "post" from the form:
    ## without authentication, it clears the session.  
      
    @answer = Answer.last
    if !params[:delta].nil? && params[:delta].length >1
      @answer.update_attributes(delta: params[:delta].to_json)#,
      render json: { question_id: @answer.question_id }.to_json
    else
      @answer.destroy
      render json: { question_id: @answer.question_id }.to_json
    end                  

  end

  private
    def answer_params
      params.require(:answer).permit(:delta,
                                     :question_id,
                                     :category_id,
                                     :user_id)
    end
end
