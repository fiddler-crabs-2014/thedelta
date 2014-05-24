class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@category = Category.find(params[:category])
  	@questions = Question.where(category_id: @category)
  end

end
