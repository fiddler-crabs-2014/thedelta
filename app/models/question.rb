class Question < ActiveRecord::Base
  validates_presence_of :query
  belongs_to :category
  has_many :answers

  def answers_by_votes
   self.answers.sort_by {|answer| answer.upvote_count}.reverse
  end

  def top_answer
    answers_by_votes[0]
  end
end
