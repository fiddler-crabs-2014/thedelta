require 'spec_helper'

describe Vote do
  let(:answer) { FactoryGirl.create(:answer) }
  let(:user_1) { FactoryGirl.create(:user)}
  let(:user_2) { FactoryGirl.create(:user)}

	it { should belong_to(:user) }
	it { should belong_to(:answer) }

  context "#record_vote" do
    it "vote +1 should increase Vote.count by 1" do
      expect{Vote.record_vote(user_1.id, answer.id, 1)
          }.to change { Vote.count }.by(1)
    end

    it "vote +1 should increase upvotes for answer by 1" do
      expect{Vote.record_vote(user_2.id, answer.id, 1)
          }.to change { answer.upvote_count }.by(1)
    end

    it "vote +1 should not change the downvote count" do
      expect{Vote.record_vote(user_2.id, answer.id, 1)
          }.to change { answer.downvote_count }.by(0)
    end

    it "vote -1 should increase Vote.count by 1" do
      expect{Vote.record_vote(user_1.id, answer.id, -1)
          }.to change { Vote.count }.by(1)
    end

    it "vote -1 should increase downvotes for answer by 1" do
      expect{Vote.record_vote(user_2.id, answer.id, -1)
          }.to change { answer.downvote_count }.by(1)
    end

    it "vote -1 should not change the upvote count" do
      expect{Vote.record_vote(user_1.id, answer.id, -1)
          }.to change { answer.upvote_count }.by(0)
    end
  end

end