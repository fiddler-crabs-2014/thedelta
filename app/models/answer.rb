class Answer < ActiveRecord::Base
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :delta, presence: true
  
  belongs_to :question
  belongs_to :user
  has_many :comments
  has_many :votes

  def upvote_count
    return Vote.where(answer_id: self.id).where("vote_value > 0").count
  end

  def downvote_count
    return Vote.where(answer_id: self.id).where("vote_value < 0").count
  end

end
