class QuestionsController < ApplicationController
  before_action :find_question_id, except: [:index]
  before_action :correct_params?, only: [:index]


  def index
    @questions = Question.where(category_id: params[:category].to_i, start_language: params[:start_language], end_language: params[:end_language])
    @category = params[:category]
    @start_language = params[:start_language] 
    @end_language = params[:end_language]
  end


  def show
    @answers = @question.answers_by_votes
  	@start_language = @question.start_language
  	@end_language = @question.end_language
  end

  def get_answer
    @answer  = @question.top_answer.delta
    render json: @answer
  end

  def get_answers
    @answers = @question.answers
    render json: @answers
  end


  def find_question_id
    @question = Question.find(params[:question_id]||params[:id]) 
  end

  def correct_params?
    unless params[:start_language] && params[:end_language] && params[:category]
      redirect_to root_path
    else
      true
    end
  end

end
