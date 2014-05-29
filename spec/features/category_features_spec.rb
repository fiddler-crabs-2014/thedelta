require 'spec_helper'

describe "Category Features" do

	describe "Category Index" do

		context "when params are sent without start and end languages" do

			it "should redirect to the homepage" do
				visit categories_path
				expect(current_path).to eq(root_path)
			end
		end

		context "when params are sent with start and end languages" do

			let!(:start_language) { Language.create(name: "Ruby") }
			let!(:end_language) { Language.create(name: "JavaScript") }
			let!(:category) { FactoryGirl.create(:category) }
			let!(:categories) { [category, Category.create(name:"Logic Flow")] }
			let!(:question){ FactoryGirl.create(:question)}
			let!(:new_category) { Category.create(name:"Classes") }

			it "should display all categories" do
				visit categories_path(start_language: start_language, end_language: end_language)
				 categories.each do |category|
				  expect(page).to have_content category.name
				end
			end

			it "user can click on a category, and redirect to questions index" do
				visit categories_path(start_language: start_language.name, end_language: end_language.name)
				click_on(new_category.name)
				current_path.should == questions_path
			end

		end
	end
end
