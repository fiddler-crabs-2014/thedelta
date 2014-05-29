require "spec_helper"

describe SessionsController do
  
  # before(:each) do
  #     ApplicationController.any_instance.stub(:last_visited_page).and_return(root_path)
  # end

  let(:user) { FactoryGirl.create(:user) }
  
  describe "#login" do
    it "should render the login template" do
      get :login
      expect(response).to render_template(:login)
    end
  end

  describe "#logout" do
    before { session[:user_id] = user.id }
    
    it "should set session[:user_id] to nil" do
      get :logout
      expect(session[:user_id]).to equal nil
    end

    it "should redirect to login page" do
      get :logout
      expect(response).to redirect_to(login_path) 
    end

  end

  describe "#attempt_login" do
    before { session[:user_id] = nil}
    before (:each) do
      ApplicationController.any_instance.stub(:last_visited_page).and_return(root_path)
    end

    it "Sets session[:user_id] with valid credentials" do
      post :attempt_login, email_username: user.email, password: user.password
      expect(session[:user_id]).to equal user.id
    end

    xit "Successful login with email redirects to profile page" do
      post :attempt_login, email_username: user.email, password: 'password'
      expect(response).to redirect_to(profile_path)
    end

    xit "Successful login with username redirects to profile page" do
      post :attempt_login, email_username: user.username, password: 'password'
      expect(response).to redirect_to(profile_path)
    end

    it "Does not set session[:user_id] with invalid credentials" do
      post :attempt_login, email_username: user.email, password: 'password1'
      expect(session[:user_id]).to equal nil
    end

    it "Unsuccessful login redirects to login page" do
      post :attempt_login, email_username: user.email, password: 'password1'
      expect(response).to redirect_to(login_path)
    end

  end
end