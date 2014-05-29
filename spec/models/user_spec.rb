require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  context "validates presence of" do
    it { user.should validate_presence_of(:username) }
    it { user.should validate_presence_of(:email) }
  end 

  context "validates uniqueness of " do
    it { user.should validate_uniqueness_of(:username) }
    it { user.should validate_uniqueness_of(:email) }
  end
  
  context 'valid values for each property' do
    it { user.should allow_value('johnsmith', 'john_smith').for(:username) }
    it { user.should allow_value('john@smith.com', 'john.smith@test.gov').for(:email) }
  end

  context 'invalid values for each property' do
    it { user.should_not allow_value('dsaff', 'john@', '@john').for(:email) }
    it { user.should_not allow_value('john@smith', 'john smith', 'john+smith').for(:username) }
  end

  it { should have_many(:answers) }
end