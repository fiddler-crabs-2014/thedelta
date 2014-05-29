require 'json'

class AnswersController < BaseAnswerController
  before_action :current_user, except: [:show]

  def new
    if params[:question]
      @question = Question.find(params[:question])
      @answer = Answer.new     
    else
      redirect_to login_path
    end
  end
  
end
