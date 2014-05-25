require 'spec_helper'

describe Question do

	it { should belong_to(:category) }

	it { should have_many(:answers) }

end