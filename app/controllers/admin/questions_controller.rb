class QuestionsController < ApplicationController

  protect_from_forgery with: :exception


  def index
    
  end


  def show
  	@question = Question.find(params[:id])
    @answers = @question.answers
  	@start_language = Language.find_by_name(@question.start_language)
  	@end_language = Language.find_by_name(@question.end_language)
  end

end
