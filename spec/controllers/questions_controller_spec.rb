require 'spec_helper'

describe QuestionsController do 

	render_views

	let(:answer) { FactoryGirl.create(:answer) }
	let(:question) { FactoryGirl.create(:question) }
	let(:user) { FactoryGirl.create(:user) }
	let!(:category) { FactoryGirl.create(:category) }

	describe "#index" do
	  it "should render the question index with a valid category, start language, and end language" do
	    get :index, { category: category }
	    expect(response).to render_template('questions/index')
	  end
	end

	describe "#show" do



	end


	describe "#get_answer" do



	end


	describe "#get_answer_by_id" do



	end
	
end