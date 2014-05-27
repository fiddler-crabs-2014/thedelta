require 'spec_helper'

describe QuestionsController do 

	render_views

	let!(:question) { FactoryGirl.create(:question) }
	let!(:answer) { FactoryGirl.create(:answer) }
	let!(:user) { FactoryGirl.create(:user) }
	let(:category) { FactoryGirl.create(:category) }
	let!(:start_language) { Language.create(name:"Ruby") }
	let!(:end_language) { Language.create(name:"JavaScript") }

	describe "#index" do
	  it "should render the question index with a valid category, start language, and end language" do
	    get :index, { category: category, start_language: start_language.name, end_language: end_language.name }
	    expect(response).to render_template('questions/index')
	  end

	  it "should not render the question index without a start language, or end language" do
	    get :index, { category: category }
	    expect(response).to redirect_to('/')
	  end

	  it "should not render the question index without a category" do
	    get :index, { start_language: start_language.name, end_language: end_language.name }
	    expect(response).to redirect_to('/')
	  end

	  it "should not render the question index without any parameters" do
	    get :index
	    expect(response).to redirect_to('/')
	  end

	end

	describe "#show" do
		it "should render the question show page with a valid question id" do
		  get :show, { id: question.id }
		  expect(response).to render_template('questions/show')
		end	

	end


	describe "#get_answer" do
		it "should retrieve the first answer for that question, with a valid question id" do
			get :get_answer, { question_id: question.id }
			expect(response).to be_success
		end

		xit "should not respond to anything but a valid question id" do
			expect{
				get :get_answer, { question_id: "hello" }
				}.to_not be_success
		end

	end


	describe "#get_answer_by_id" do
		it "should retrieve the answers with a valid question id" do
			get :get_answers, {question_id: question.id}
			expect(response).to be_success
		end

		xit "should not respond to anything but a valid answer id" do
			expect{
				get :get_answers
				}.to_not be_success
		end


	end
	
end