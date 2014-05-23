class CategoriesController < ActionController

  protect_from_forgery with: :exception


  def index
  	@categories = Categories.all
  end

end
