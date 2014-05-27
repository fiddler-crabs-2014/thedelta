require 'spec_helper'

describe AnswersController do 

	let!(:answer) { FactoryGirl.create(:answer) }
	let!(:question) { FactoryGirl.create(:question) }
	let!(:user) { FactoryGirl.create(:user) }

	describe "#new" do
		context "with current_user" do

			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(user)
  		end

		  it "should render the new answer template, with a question and current user" do
		    get :new, question: question.id
		    expect(response).to render_template('answers/new')
		  end

		  it "should not render the new answer template without a question" do
		    get :new
		    expect(response).to redirect_to('/login')
		  end

		  it "should assign @answer to be a new Answer" do
		    get :new, question: question.id
		    expect(assigns(:answer)).to be_a_new Answer
		  end

		  it "should assign @question to be a question" do
		    get :new, question: question.id
		    expect(assigns(:question)).to be_a Question
		  end

		end

		context "without current_user" do

		  it "should not render the new answer template without a current user" do
		    get :new, question: question.id
		    expect(response).to redirect_to('/login')
		  end

		  it "should not render the new answer template without a question" do
		    get :new
		    expect(response).to redirect_to('/login')
		  end
		end

	end


	describe "#show" do

		it "should find the answer given answer id" do
		    get :show, id: answer.id
		    expect(response).to be_success
		end
	end


	describe "#create" do

		it "should respond with a delta paramter" do
		    get :create, delta: answer.delta
		    expect(response).to be_success
		end

		it "should not respond without a delta parameter" do
		    get :create
		    expect(response).to_not be_success
		end

	  it "should create an answer with valid attributes" do
	    expect {
	      Answer.create(question_id: question.id, user_id: user.id, delta: "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}")
	      	
	      }.to change { Answer.count }.by(1)
	  end

	  it "should not create an answer without valid attributes" do
	    expect {
	      Answer.create(question_id: "", user_id: "", delta: "")
	      }.to_not change { Answer.count }.by(1)
	  end

  	it "should redirect to the new answer page without a delta parameter" do
  		get :create
  		expect(response).to redirect_to('/answers/new')
  	end

  	it "should redirect to the new answer page if delta is not an actual change" do
  		get :create, delta: [0]
  		expect(response).to redirect_to('/answers/new')
  	end
	end
end