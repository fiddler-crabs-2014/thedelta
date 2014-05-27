class LanguagesController < ApplicationController

  def index
    @splash = true
    @languages = Language.all
  end
  
end
