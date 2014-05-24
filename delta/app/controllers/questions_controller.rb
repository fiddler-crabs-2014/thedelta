class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	p @category = Category.find(params[:category])
  	#@start_language = Language.find(params[:start_language])
  	#@end_language = Language.find(params[:end_language])
  	p @questions = Question.where(category_id: @category)
  end

end
