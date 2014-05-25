require 'spec_helper'

describe CategoriesController do 

	render_views

	let(:question) { FactoryGirl.create(:question) }
	let(:user) { FactoryGirl.create(:user) }
	let(:start_language) {Language.create(name:"Ruby")}
	let(:end_language) {Language.create(name:"JavaScript")}

	describe "#index" do
	  it "should not render the new answer template without proper parameters" do
	    get :index
	    expect(response).to_not be_success
	  end

	  it "should render the new answer template with proper parameters" do
	    get :index, start_language: start_language, end_language: end_language
	    expect(response).to be_success
	  end

	end
	
end