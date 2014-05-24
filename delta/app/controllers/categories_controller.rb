class CategoriesController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@categories = Category.all
    @start_language = params[:start_language]
    @end_language   = params[:end_language]
  end

  def show
  	@category = Category.find(params[:id])
  	@questions = Question.where(category_id: @category)
  end

end
