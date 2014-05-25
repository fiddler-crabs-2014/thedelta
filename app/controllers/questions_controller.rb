class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@category = Category.find(params[:category])
  	@start_language = Language.find_by_name(params[:start_language])
  	@end_language = Language.find_by_name(params[:end_language])
  	@questions = Question.where(category_id: @category, start_language: @start_language, end_language: @end_language)
  end


  def show
  	@question = Question.find(params[:id])
  	@start_language = Language.find(@question.start_language)
  	@end_language = Language.find(@question.end_language)
    @answers = Answer.where(:question_id => params[:id])
  end

  def get_answer
    @question = Question.find(params[:question_id])
    @answer  = @question.answers.first.delta
    render json: @answer
  end

  def get_answers
    @question = Question.find(params[:question_id])
    @answers  = @question.answers
    render json: @answers
  end

end
