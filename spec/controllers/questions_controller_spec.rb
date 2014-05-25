require 'spec_helper'

describe QuestionsController do 

	let(:answer) { FactoryGirl.create(:answer) }
	let(:question) { FactoryGirl.create(:question) }
	let(:user) { FactoryGirl.create(:user) }
	let(:category) { FactoryGirl.create(:user) }

	describe "#index" do
	  xit "should render the question index with a valid category, start language, and end language" do
	    get :new, category: 
	    expect(response).to render_template(:new)
	  end

	  xit "should assigns @answer to Answer.new, with a user and question id." do
	    get :new, question_id: question, user_id: user
	    expect(assigns(:answer)).to be_a_new Answer
	  end
	end

	describe "#create" do
	  it "should create an answer with valid attributes" do
	    expect {
	      Answer.create(question_id: question.id, user_id: user.id, delta: "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}")
	      	
	      }.to change { Answer.count }.by(1)
	  end

	  xit "should not create an answer with out a delta" do
	    expect {
	      post :create, answer: { delta: ""}
	      }.to_not change { Answer.count }.by(1)
	  end
	end


	
end