require 'spec_helper'

describe AnswersController do 

	let(:answer) { FactoryGirl.create(:answer) }
	let!(:question) { FactoryGirl.create(:question) }
	let!(:user) { FactoryGirl.create(:user) }

	describe "#new" do
	  it "should render the new answer template" do
	    get :new
	    expect(response).to render_template(:new)
	  end

	  it "should assigns @answer to Answer.new" do
	    get :new
	    expect(assigns(:answer)).to be_a_new Answer
	  end
	end

	describe "#create" do
	  it "should create an answer with valid attributes" do
	    expect {
	      Answer.create(question_id: question.id, user_id: user.id, delta: "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}")
	      	
	      }.to change { Answer.count }.by(1)
	  end

	  it "should not create an answer with invalid attributes" do
	    expect {
	      post :create, answer: {question_id: "", user_id: "", delta: ""}
	      }.to_not change { Answer.count }.by(1)
	  end
	end


	
end