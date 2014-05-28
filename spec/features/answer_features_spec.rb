require 'spec_helper'

feature "Answer Features" do
	let!(:answer) { FactoryGirl.create(:answer) }
	let(:start_language) { Language.create(name: "Ruby") }
	let(:end_language) { Language.create(name: "JavaScript") }
	let(:user) { FactoryGirl.create(:user) }

	before(:each) do
   		ApplicationController.any_instance.stub(:current_user).and_return(user)
	end

	feature "Answer Show Page" do
		it "should show the initial stage, the detla, and the final stage of the code" do
				visit answer_path(answer)
				page.all('pre').count.should eq(3)
		end

		it "should display the all the question name" do
			visit answer_path(answer)
			expect(page).to have_content answer.question.query
		end

		it "should display start language" do
			visit answer_path(answer)
			expect(page).to have_content(start_language.name)
		end

		it "should display end language" do
			visit answer_path(answer)
			expect(page).to have_content(end_language.name)
		end

		it "should display a play button" do
			visit answer_path(answer)
			click_on('Play')
		end

		it "should display an upvote button" do
			visit answer_path(answer)
			click_on('Up Vote')
		end

		it "upvote button should increase up vote count" do
			visit answer_path(answer)
			expect{
				click_on('Up Vote')
				}.to change { Vote.count }.by(1)
		end

		it "should display a downvote button" do
			visit answer_path(answer)
			click_on('Down Vote')
		end

		it "downvote button should increase down vote count" do
			visit answer_path(answer)
			expect{
				click_on('Down Vote')
				}.to change { Vote.count }.by(1)
		end


		it "should allow the user to choose once, and does not allow the user to click upvote and down vote multiple times" do
			visit answer_path(answer)
			expect{
				click_on('Down Vote')
				click_on('Up Vote')
				click_on('Down Vote')
				}.to change { Vote.count }.by(1)
		end

		it "should display the user who submitted the answer" do
			visit answer_path(answer)
			expect(page).to have_content answer.user.username
		end

		it "should display a link back to the Question" do
			visit answer_path(answer)
			click_on('Question')
			current_path.should == question_path(answer.question)
		end
	end

	feature "New Answer Page" do

		it "Should have only one text area" do
			visit new_answer_path(question: answer.question)
			fill_in('answer_delta', with: "this is the delta box")
		end

		it "should have eight buttons (4 instructions 4 real)" do
			visit new_answer_path(question: answer.question)
			page.all('button').count.should eq(8)
		end

		it "should have a link to return back to the question" do
			visit new_answer_path(question: answer.question)
			click_link('question_return')
			current_path.should == question_path(answer.question)
		end

		it "should display the question" do
			visit new_answer_path(question: answer.question)
			expect(page).to have_content answer.question.query
		end

		it "should display start language" do
			visit new_answer_path(question: answer.question)
			expect(page).to have_content(start_language.name)
		end

		it "should display end language" do
			visit new_answer_path(question: answer.question)
			expect(page).to have_content(end_language.name)
		end

		it "should show the replay once play is clicked" do
			visit new_answer_path(question: answer.question)
			page.all('pre').count.should eq(1)
		end

	end 

end