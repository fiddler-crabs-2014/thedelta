require 'json'

class Admin::AnswersController < BaseAnswerController
  before_filter :confirm_admin
  def index
    @answers = Answer.all
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to admin_answers_path
  end

end
