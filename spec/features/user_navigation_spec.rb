require 'spec_helper'

describe "User Navigation" do

	context "Homepage " do
		it "User can click go learn" do
			visit root_path
			find_link("Go learn!")
		end

		xit "Go learn will redirect them to categories page" do
			visit root_path
			click Ruby
			click JavaScript
			find_link("Go learn!")
			expect(current_path).to eq(categories_path(start_language:"Ruby", end_language: "JavaScript"))
		end

		it "Go learn will not redirect them to categories page, unless they pick two languages" do
			visit root_path
			find_link("Go learn!")
			expect(current_path).to eq(root_path)
		end

	end

end