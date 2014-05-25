class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@category = Category.find(params[:category])
  	@start_language = Language.find_by_name(params[:start_language])
  	@end_language = Language.find_by_name(params[:end_language])
  	@questions = Question.where(category_id: @category.id, start_language: @start_language, end_language: @end_language)
  end


  def show
  	@question = Question.find(params[:id])
    @answers = @question.answers
  	@start_language = Language.find(@question.start_language)
  	@end_language = Language.find(@question.end_language)
  end

  def get_answer
    @question = Question.find(params[:question_id])
    if !@question.answers.empty?
      @answer  = @question.answers.first.delta
      render json: @answer
    else
      render text: 'This question needs an answer'
    end
  end

  def get_answer_by_id
    @answer = Answer.find(params[:answer_id])
    render json: @answer.delta
  end

end
