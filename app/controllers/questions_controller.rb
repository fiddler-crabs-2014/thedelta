class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
    if params[:start_language] && params[:end_language] && params[:category]
      @category = Category.find(params[:category])
    	@category_id = Category.find(params[:category]).id
    	@start_language = Language.find_by_name(params[:start_language]).name
    	@end_language = Language.find_by_name(params[:end_language]).name
    	@questions = Question.where(category_id: @category_id, start_language: @start_language, end_language: @end_language)
    else
      redirect_to root_path
    end
  end


  def show
  	@question = Question.find(params[:id])
    @answers = @question.answers
  	@start_language = Language.find_by_name(@question.start_language)
  	@end_language = Language.find_by_name(@question.end_language)
  end

  def get_answer
    @question = Question.find(params[:question_id])
    @answer  = @question.answers.first.delta
    render json: @answer
  end

  def get_answer_by_id
    @answer = Answer.find(params[:answer_id])
    render json: @answer.delta
  end

end
