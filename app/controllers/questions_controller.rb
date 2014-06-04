class QuestionsController < ApplicationController
  before_action :find_question_id, except: [:index, :new, :create]
  before_action :correct_params?, only: [:index]

  def index
    @questions = Question.where(category_id: params[:category].to_i, start_language: params[:start_language], end_language: params[:end_language])
    @category = Category.find(params[:category])
    @start_language = params[:start_language] 
    @end_language = params[:end_language]
  end

  def new
    @question = Question.new
    @start_language = params[:start_language]
    @end_language = params[:end_language]
    @category = Category.find(params[:category]).name
  end

  def create
    @question = Question.new(question_params)
    @category_id = Category.find_by_name(params[:question][:category]).id
    @question.category_id = @category_id
    @start_language = params[:question][:start_language]
    @end_language = params[:question][:end_language]
    if @question.save
      redirect_to("/questions?category=#{@category_id}&end_language=#{@end_language}&start_language=#{@start_language}")
    else
      redirect_to root_path
    end
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

  private
  def question_params
    params.require(:question).permit(:query, :start_language, :end_language, :category_id)
  end

end
