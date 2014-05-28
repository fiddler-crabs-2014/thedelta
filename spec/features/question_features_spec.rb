require 'spec_helper'

describe "Question Features" do
	let!(:question){ FactoryGirl.create :question }
	let!(:questions) { [question, FactoryGirl.create(:question)] }
	let!(:start_language) { Language.create(name: "Ruby") }
	let!(:end_language) { Language.create(name: "JavaScript") }
	let!(:category) { FactoryGirl.create(:category) }
	let!(:answer) {FactoryGirl.create(:answer)}
	let!(:user) {FactoryGirl.create(:user)}


	
	describe "Question Index" do



		context "when params are sent without category, or start and end languages" do

			it "should redirect to the homepage" do
				visit categories_path
				expect(current_path).to eq(root_path)
			end

		end

		context "when params are sent with category and start and end languages" do

			it "should display start language" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_content(start_language.name)
			end

			it "should display end language" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_content(end_language.name)
			end

			it "should display a play button" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				click_on('Play')
			end

			it "should display the all the questions names" do
				visit questions_path(category: category, start_language: question.start_language, end_language: question.end_language)
				category.questions.each do |question|
				  expect(page).to have_content question.query
				end

			end

			it "should display the top answer for that question in a box" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_css('pre')
			end

			it "should display the top answer's user" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				expect(page).to have_content answer.user.username
			end
			
			it "should show the top answer for each question, if that question has an answer" do
				visit questions_path(category: answer.question.category, start_language: question.start_language, end_language: question.end_language)
				page.all('pre').count.should eq(Answer.where(question: answer.question).count)
			end
		end
	end

	describe "Questions Show Page" do

		it "should display the question title" do
			visit question_path(answer.question)
			expect(page).to have_content(answer.question.query)
		end

		it "should display start language" do
			visit question_path(question)
			expect(page).to have_content(answer.question.start_language)
		end

		it "should display end language" do
			visit question_path(question)
			expect(page).to have_content(answer.question.end_language)
		end

		it "should display a play button" do
			visit question_path(answer.question)
			click_on('Play')
		end

		it "should display answers deltas (boxes)" do
			visit question_path(answer.question)
			expect(page).to have_css('pre')
		end

		it "should display the user who submitted the answer" do
			visit question_path(answer.question)
			expect(page).to have_content answer.user.username
		end

		it "should display 'see answer' link" do
			visit question_path(answer.question)
			find_link('See Answer')
		end

		it "should redirect when 'see answer' is clicked" do
			visit question_path(answer.question)
			click_link('See Answer')
			current_path.should == answer_path(answer.id)
		end

		it "should display 'Add Answer' link" do
			visit question_path(answer.question)
			find_link('Add Answer')
		end

		it "should display vote count" do
			visit question_path(answer.question)
			expect(page).to have_css('.vote_count')
		end


		context "when a user is not signed in" do
			it "should redirect when there isn't a user signed in" do
				visit question_path(question)
				click_on('Add Answer')
				current_path.should == login_path
			end
		end

		context "when a user is signed in" do
			it "should redirect to the answer new page when a user is signed in" do
     		ApplicationController.any_instance.stub(:current_user).and_return(user)
				visit question_path(question)
				click_on('Add Answer')
				current_path.should == new_answer_path
			end
		end


	end






end