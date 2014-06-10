require 'spec_helper'

describe Admin::AnswersController do 

	let(:answer) { FactoryGirl.create(:answer) }
	let(:user) { FactoryGirl.create(:user) }
	let(:admin_user) { FactoryGirl.create(:admin) }

	render_views

	describe "#index" do
		context "with current_admin" do

			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(admin_user)
  		end

		  it "should render the answers template" do
		    get admin_answers_path
		    expect(response).to render_template(:index)
		  end

		end

		context "with current_user (non-admin)" do
			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(user)
  		end

		  it "should redirect users to profile page" do
		    get admin_answers_path
		    expect(response).to redirect_to(profile_path)
		  end

		end

		context "without current_user" do
			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(nil)
  		end

		  it "redirect visitor to the login page" do
		    get admin_answers_path
		    expect(response).to redirect_to(login_path)
		  end

		end
	end


	describe "#show" do
		context "with current_admin" do

			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(admin_user)
  		end
			
			it "should find the answer given answer id" do
		  	get :show, id: answer.id
		  	expect(response).to be_success
			end

			it "should render the show template" do
		  	get :show, id: answer.id
		  	expect(response).to render_template(:show)
			end
		end

		context "with current_user (non-admin)" do
			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(admin_user)
  		end

  		it "should redirect to profile page" do 
  			get :show, id: answer.id
  			expect(reponse).to redirect_to profile_path
  		end
		end

		context "with no current_user" do
			before(:each) do
     		ApplicationController.any_instance.stub(:current_user).and_return(admin_user)
  		end

  		it "should redirect to profile page" do 
  			get :show, id: answer.id
  			expect(reponse).to redirect_to login_path
  		end
		end
	end

	describe "#destroy" do
		it "should reduce answer count by 1" do
			expect{ delete :destroy, id: answer.id
          }.to change { Answer.count }.by(-1)
		end

	end
	
end