require 'spec_helper'

describe "User can visit homepage" do
  context "and a sign up button" do
    xit "can be seen" do
      visit root_path
      find_link('Register')
    end
    xit "will be redirect them to sign up page" do
      visit root_path
      find_link('Register').click
      expect(current_path).to eq(new_user_path)
    end
  end
end