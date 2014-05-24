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
  end

end
