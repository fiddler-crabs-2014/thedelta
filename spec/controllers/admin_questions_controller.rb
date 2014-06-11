require 'spec_helper'

describe Admin::QuestionsController do

  let(:question) { FactoryGirl.create(:question) }
  let(:admin_user)    { FactoryGirl.create(:admin) }

  render_views

  describe "#index" do
    context "with current_admin" do

      before(:each) do
        ApplicationController.any_instance.stub(:current_user).and_return(admin_user)
      end

      it "should render the questions template" do
        get admin_questions_path
        expect(response).to render_template(:index)
      end

    end
  end

end