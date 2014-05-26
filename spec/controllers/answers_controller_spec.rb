require 'spec_helper'

describe AnswersController do 

	let(:answer) { FactoryGirl.create(:answer) }
	let!(:question) { FactoryGirl.create(:question) }
	let!(:user) { FactoryGirl.create(:user) }

	# user_mock = mock "User"
	# user_mock.should_receive(:current_user).and_return(user)


	describe "#new" do
	  xit "should render the new answer template" do
	    get :new, question: question.id
	    expect(response).to render_template(:new)
	  end

	  xit "should assigns @answer to Answer.new, with a user and question id." do
	    get :new, question: question.id, user_id: user
	    expect(assigns(:answer)).to be_a_new Answer
	  end
	end

	describe "#create" do
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


	  



	  
	end


	
end