require 'spec_helper'

describe ApplicationController do 

  context "when a user is not signed in and no session is set" do
  	before { session[:user_id] = nil }
    before { controller.stub(current_user: nil) }
    describe "#signed_in" do
      it "should return false"do
      controller.signed_in?.should be_false
  	 end
    end

  	describe "#current_user" do
  		it "should return nil" do
  		  controller.current_user.should be_nil
  		end
  	end

  	describe "#current_admin" do
      it "should return nil" do
        controller.current_admin.should be_nil
      end
  	end

    describe "#current_user?" do
      it "should return false" do
        controller.current_user?("").should be_false
      end
    end
  end

  context "when a user is signed in and a session is set" do
    let!(:user) { FactoryGirl.create(:user) }
    before { controller.stub(current_user: user) }
    before { session[:user_id] = user.id }
    
    describe "#signed_in" do
      it "should return true"do
        controller.signed_in?.should be_true
      end
    end

    describe "#current_user" do
      it "should return current user id" do
        controller.current_user.should eq(user)
      end
    end

    describe "#current_admin" do
      it "should return nil" do
        controller.current_admin.should be_nil
      end
    end

    describe "#current_user?" do
      it "should return true" do
        controller.current_user?(user).should be_true
      end
    end

    describe "#sign_out" do
      it "should return nil" do
        controller.sign_out.should be_nil
      end
    end

    describe "#signed_in_user" do
      it "should return nil" do
        controller.stub(signed_in?: true)
        controller.signed_in_user.should be_nil
      end
    end


    describe "#confirm_logged_in" do
      it "should return true" do
        controller.confirm_logged_in.should be_true
      end
    end

    describe "#confirm_admin" do
      xit "should redirect to login with flash message" do
        controller.confirm_admin.should be_false
      end
    end
  end

  context "when a user is an admin" do
    let(:admin) { FactoryGirl.create(:admin) }
    before { controller.stub(current_user: admin) }
    before { session[:user_id] = admin.id }
    
    describe "#signed_in" do
      it "should return true"do
        controller.signed_in?.should be_true
      end
    end

    describe "#current_user" do
      it "should return current user id" do
        controller.current_user.should eq(admin)
      end
    end

    describe "#current_admin" do
      it "should return true" do
        controller.current_admin.should be_true
      end
    end

    describe "#current_user?" do
      it "should return true" do
        controller.current_user?(admin).should be_true
      end
    end

    describe "#sign_out" do
      it "should return nil" do
        controller.sign_out.should be_nil
      end
    end

    describe "#signed_in_user" do
      it "should return nil" do
        controller.stub(signed_in?: true)
        controller.signed_in_user.should be_nil
      end
    end


    describe "#confirm_logged_in" do
      it "should return true" do
        controller.confirm_logged_in.should be_true
      end
    end

    describe "#confirm_admin" do
      it "should return true" do
        controller.confirm_admin.should be_true
      end
    end
  end

end