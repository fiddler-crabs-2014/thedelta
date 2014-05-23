class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.integer :vote_count

      t.timestamps
    end
  end
end
