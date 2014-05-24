require 'spec_helper'

describe User do
  context "validates presence of" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    xit { should validate_presence_of(:password_digest) }
  end 

  context "validates uniqueness of " do
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }
  end
  
  context 'valid values for each property' do
    it { should allow_value('johnsmith', 'john_smith').for(:username) }
    it { should allow_value('john@smith.com', 'john.smith@test.gov').for(:email) }
  end

  context 'invalid values for each property' do
    xit { should_not allow_value('dsaff', 'john@', '@john').for(:email) }
    xit { should_not allow_value('john smith', 'john+smith', 'john@smith').for(:username) }
  end

  

  it { should have_many(:answers) }
end