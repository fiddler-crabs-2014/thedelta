class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  

  def self.record_vote(user_id, answer_id, vote_value)
    record_vote = Vote.where(answer_id: answer_id, user_id: user_id).first
    
    if record_vote.nil?
      record_vote = Vote.create(answer_id: answer_id, user_id: user_id)
    end
    record_vote.vote_value =  vote_value
    record_vote.save
    return  record_vote
  end

  private

    def update_answer
      self.answer.update_votes
    end
  
end
