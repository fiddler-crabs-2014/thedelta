require 'spec_helper'

describe "Question Features" do
	describe "Question Index" do

		let!(:question){ create :question }
  	let!(:questions) { [question, create(:question)] }


		context "when params are sent without category, or start and end languages" do

			it "should redirect to the homepage" do
				visit categories_path
				expect(current_path).to eq(root_path)
			end

		end

		context "when params are sent with category and start and end languages" do
			let!(:start_language) { Language.create(name: "Ruby") }
			let!(:end_language) { Language.create(name: "JavaScript") }
			let!(:category) { FactoryGirl.create(:category) }
			let!(:question) {FactoryGirl.create(:question)}
			let!(:answer) {FactoryGirl.create(:answer)}
			let!(:user) {FactoryGirl.create(:user)}

			it "should display start language" do
				visit questions_path(category: category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_content(start_language.name)
			end

			it "should display end language" do
				visit questions_path(category: category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_content(end_language.name)
			end

			it "should display a play button" do
				visit questions_path(category: category, start_language: question.start_language, end_language: question.end_language)
				click_on('Play')
			end

			it "should display the all the questions names" do
				visit questions_path(category: category, start_language: question.start_language, end_language: question.end_language)
				questions.each do |question|
				  expect(page).to have_content question.query
				end

			end

			it "should display the top answer for that question" do

			end



		end
	end





end