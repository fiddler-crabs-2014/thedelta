require 'spec_helper'

describe "User can visit the home page" do
  
  context "and a sign up button" do
    it "can be seen" do
      visit root_path
      find_link('Sign up')
    end
    it "will be redirect them to sign up page" do
      visit root_path
      find_link('Sign up').click
      expect(current_path).to eq(sign_up_path)
    end
  end

  context "and a login up button" do
    it "can be seen" do
      visit root_path
      find_link('Login')
    end

    it "will be redirect them to login page" do
      visit root_path
      find_link('Login').click
      expect(current_path).to eq(login_path)
    end
  end
end

describe "User can visit signup page" do
  let(:user) { FactoryGirl.create(:user) }

  context "and the user can sign up" do
    
    xit "valid user creditials can create an account" do
      visit sign_up_path
      fill_in 'user_name', :with => user.name
      fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirm', :with => 'password'
      
      click_on 'Create User'  

      expect(current_path).to eq(profile_path)
    end

  end

  context "invalid inputs do not allow signup" do

    xit "invalid emails can not create an account" do
      visit sign_up_path
      fill_in 'user_name', :with => user.name
      fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => "bad.email@f"
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirm', :with => 'password'
      
      click_on 'Create User'  

      expect(current_path).to eq(sign_up_path)
    end

    xit "invalid usernames with an '@'-sign do not create an account" do
      visit sign_up_path
      fill_in 'user_name', :with => user.name
      fill_in 'user_username', :with => 'my@user'
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirm', :with => 'password'
      
      click_on 'Create User'  

      expect(current_path).to eq(sign_up_path)

    end

    xit "mismatched password confirmation can not create an account" do
      visit sign_up_path
      fill_in 'user_name', :with => user.name
      fill_in 'user_username', :with => user.username
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => 'password1'
      fill_in 'user_password_confirm', :with => 'password2'
      
      click_on 'Create User'  

      expect(current_path).to eq(sign_up_path)

    end

    xit "duplicate email can not create an account" do
      visit sign_up_path

    end

    xit "duplicate username can not create an account" do
      visit sign_up_path

    end

  end
end

describe "User can visit login page" do
  let(:user) { FactoryGirl.create(:user) }

  context "and valid creditals will login" do
    it "valid email / password can login" do
      visit login_path
      
      fill_in 'email_username', :with => user.username
      fill_in 'password', :with => 'password'
      click_on 'Sign In'  
      expect(current_path).to eq(profile_path)
    end


    xit "valid email / password shows profile welcome message" do
      visit login_path
      
      fill_in 'email_username', :with => user.username
      fill_in 'password', :with => 'password'
      click_on 'Sign In' 
      #expect page to be profile page text 
      #expect(current_path).to eq(profile_path)
    end
  end

  context "and invalid creditals will login" do

    xit "invalid user creditials can not login" do
      visit login_path

      fill_in 'email_username', :with => 'J-Random-Hacker'
      fill_in 'password', :with => 'Awesomepost!'
      click_on 'Sign In'  

      expect(current_path).to eq(login_path)
    end

  end
end