class CategoriesController < ApplicationController

  protect_from_forgery with: :exception

  def index
    if params[:start_language] && params[:end_language]
    	@categories = Category.all
      @start_language = params[:start_language]
      @end_language   = params[:end_language]
    else
      redirect_to root_path
    end
  end

end
