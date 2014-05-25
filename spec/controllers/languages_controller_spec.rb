require 'spec_helper'

describe LanguagesController do 

	render_views

	describe "#index" do
	  it "should render the language index template" do
	    get :index
	    expect(response).to be_success
	  end

	end
	
end