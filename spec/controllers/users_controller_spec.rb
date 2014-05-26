require "spec_helper"

describe UsersController do
  
  let(:user) { FactoryGirl.create(:user) }

  render_views
  
  describe "#new" do
    it "should render the signup template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should assigns @user to User.new" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "#create" do
    subject {post :create, user: FactoryGirl.attributes_for(:user)}

    it "should create user valid attributes" do
      expect{post :create, user: FactoryGirl.attributes_for(:user)}.to change { User.count }.by(1)
    end

    xit "should redirect to profile page after creating user" do
      expect{ post :create, user: FactoryGirl.attributes_for(:user)
        }.to redirect_to(profile_path) 
    end

    xit "should not create user with invalid email" do
      expect {
        post :create, user: {username: user.username, email: '123@', password: 'password', password_confirmation: 'password'}
        
        }.to change { User.count }.by(0)
    end
  end

  describe "#profile" do

    it "should render profile page when logged in" do
      session[:user_id] = user.id 
      get :profile
      expect(response).to render_template(:profile)
    end

    it "should redirect to login if logged out" do
      session[:user_id] = nil
      get :profile
      expect(response).to redirect_to(:login)
    end
  end


  describe "#edit" do
    before { session[:user_id] = user.id }

    it "renders the edit template" do
      get :edit, id: user.id
      expect(response).to render_template(:edit)
    end

    it "redirect to login if not logged in" do
      session[:user_id] = nil
      get :edit, id: user.id
      expect(response).to redirect_to login_path
    end
  end

  describe "#update" do
    xit "it changes the records if valid" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end

    xit "is unsuccessful if invalid email" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end

    xit "is unsuccessful if invalid username" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end

    xit "is unsuccessful if duplicate email" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end

    xit "is unsuccessful if duplicate username" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end

    xit "is unsuccessful if passwords do not match" do
      put :update, user: {email: "bob@bob"}
      expect(response).to_not be_success
    end
  end
end