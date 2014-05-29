require 'spec_helper'

describe "User Navigation" do

	let!(:start_language) { Language.create(name:"Ruby") }
	let!(:end_language) { Language.create(name:"JavaScript") }
	let(:category) { FactoryGirl.create(:category) }

	context "Homepage " do
		it "User can click go learn" do
			visit root_path
			find_link("Go learn!")
		end

		xit "Go learn will redirect them to categories page" do
			visit root_path
			select(start_language.name, :from => 'start_language')
			select(end_language.name, :from => 'end_language')
			click_link("Go learn!")
			expect(current_path).to eq(categories_path(start_language: start_language.name, end_language: end_language.name))
		end

		it "Go learn will not redirect them to categories page, unless they pick two languages" do
			visit root_path
			click_link("Go learn!")
			expect(current_path).to eq(root_path)
		end

	end

end