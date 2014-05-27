require 'spec_helper'

describe Vote do
  let(:answer) { FactoryGirl.create(:answer) }

	it { should belong_to(:user) }
	it { should belong_to(:answer) }

  context "#record_vote" do
    xit "should increase vote count by 1" do
      expect{Vote.record_vote(answer.user.id, answer.id, 1)
          }.to change { Vote.count }.by(1)
    end
  end

end