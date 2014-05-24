class CategoriesController < ApplicationController

  protect_from_forgery with: :exception


  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  	@questions = Question.where(category_id: @category)
  end

end
