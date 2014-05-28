require 'spec_helper'

describe ApplicationController do 


	describe "#new" do
		context "with current_user" do
			
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

	end
end