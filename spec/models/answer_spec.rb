require 'spec_helper'

describe Answer do

	it { should belong_to(:question) }
	it { should belong_to(:user) }
	it { should have_many(:comments) }
	xit { should have_many(:votes) }

end