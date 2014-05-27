require "spec_helper"

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  
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

    it "should redirect to profile page after creating user" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to(profile_path) 
    end

    xit "should not create user with invalid email" do
      expect {
        post :create, user: {username: user.username, email: '', password: 'password', password_confirmation: 'password'}
        
        }.to change { User.count }.by(0)
    end

    it "invalid email should render new template" do
      
      post :create, user: {username: user.username, email: '123@', password: 'password', password_confirmation: 'password'}
        
      expect(response).to render_template :new
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
    before { session[:user_id] = user.id }
    let(:user_2) { FactoryGirl.create(:user) }
    it "it changes the records if valid" do
      put :update, id: user.id, user: {email: "bob@bob.com"}
      user.reload
      expect(user.email).to eq "bob@bob.com"
    end

    it "it redirects to profile page if updates the record" do
      put :update, id: user.id, user: {email: "bob@bob.com"}
      expect(user.email).to redirect_to(:profile)
    end

    it "if invalid email renders the edit template" do
      put :edit, id: user.id, user: {email: "bob@bob"}
      expect(response).to render_template(:edit)
    end

    it "if duplicate email -> unsuccessful -> render :edit template" do
      put :edit, id: user.id, user: {email: user_2.email}
      expect(response).to render_template(:edit)
    end

    it "if duplicate username -> unsuccessful -> render :edit template" do
      put :update, id: user.id, user: {username: user_2.username}
      expect(response).to render_template(:edit)
    end

    it "is unsuccessful if passwords do not match" do
      put :update, id: user.id, user: {password: "password1", password_confirmation: "password2"}
      expect(response).to render_template(:edit)
    end
  end
end