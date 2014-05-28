class AddVoteCount < ActiveRecord::Migration
  def up
    add_column :answers, :upvote_count, :integer, default: 0
    add_column :answers, :downvote_count, :integer, default: 0
  end

  def down
    remove_column :answers, :upvote_count
    remove_column :answers, :downvote_count
  end
end
