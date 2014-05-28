require "spec_helper"

describe VotesController do
  let(:user_1) { FactoryGirl.create(:user) }
  let(:user_2) { FactoryGirl.create(:user) }
  let(:user_3) { FactoryGirl.create(:user) }
  let(:user_4) { FactoryGirl.create(:user) }
  let(:answer) { FactoryGirl.create(:answer) }

  describe "#record" do


    it "should record one up vote" do
      session[:user_id] = user_1.id
      expect {
        post :record, answer_id: answer.id, vote_value: 1
        
        }.to change { Vote.count }.by(1)
    end

    it "should record one down vote" do
      
      expect {
        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: -1
        
        }.to change { Vote.count }.by(1)

    end

    it "should record multiple (4) up votes" do
      expect {
        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_2.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_3.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_4.id
        post :record, answer_id: answer.id, vote_value: 1
        
        }.to change { Vote.count }.by(4)

    end    

  
    it "should record multiple (4) up votes" do
      expect {
        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: -1

        session[:user_id] = user_2.id
        post :record, answer_id: answer.id, vote_value: -1

        session[:user_id] = user_3.id
        post :record, answer_id: answer.id, vote_value: -1

        session[:user_id] = user_4.id
        post :record, answer_id: answer.id, vote_value: -1
        
        }.to change { Vote.count }.by(4)

    end 

    it "multiple upvotes by the same user should not increase vote count" do
      expect {
        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1
        
        }.to change { Vote.count }.by(1)

    end 

    it "multiple up/down votes by the same user should not increase vote count" do
      expect {
        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: -1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: 1

        session[:user_id] = user_1.id
        post :record, answer_id: answer.id, vote_value: -1
        
        }.to change { Vote.count }.by(1)

    end   

    it "multiple +1 votes change upvote_count" do
    
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: 1

      expect(answer.upvote_count).to eq 4

    end  

    it "multiple +1 votes do not change downvote_count" do
      
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: 1

      expect(answer.downvote_count).to eq 0

    end

    it "multiple -1 votes change downvote_count" do
      
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: -1

      expect(answer.downvote_count).to eq 4

    end 

    it "multiple -1 votes do not change upvote_count" do
      
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: -1

      expect(answer.upvote_count).to eq 0

    end 

    it "multiple +/- votes changes upvote_count" do
      
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: -1

      expect(answer.upvote_count).to eq 2

    end

    it "multiple +/- votes changes downvote_count" do
      
      session[:user_id] = user_1.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_2.id
      post :record, answer_id: answer.id, vote_value: -1

      session[:user_id] = user_3.id
      post :record, answer_id: answer.id, vote_value: 1

      session[:user_id] = user_4.id
      post :record, answer_id: answer.id, vote_value: -1

      expect(answer.downvote_count).to eq 2

    end  

  end

end