class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@category = Category.find(params[:category])
  	#@start_language = Language.find(params[:start_language])
  	#@end_language = Language.find(params[:end_language])
  	@questions = Question.where(category_id: @category)
  end


  def show
  	@question = Question.find(params[:id])
  end

end
