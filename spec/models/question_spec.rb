require 'spec_helper'

describe Question do

  let(:user_1) { FactoryGirl.create(:user) }
  let(:user_2) { FactoryGirl.create(:user) }
  let(:user_3) { FactoryGirl.create(:user) }
  let(:user_4) { FactoryGirl.create(:user) }
  let(:user_5) { FactoryGirl.create(:user) }
  let(:answer_1) {FactoryGirl.create(:answer)}
  let(:answer_2) {FactoryGirl.create(:answer)}
  let(:answer_3) {FactoryGirl.create(:answer)}

	it { should belong_to(:category) }
	it { should have_many(:answers) }


end