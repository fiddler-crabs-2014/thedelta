class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :answer
      t.integer :vote_value, default: 0
      t.timestamps
    end
  end
end
