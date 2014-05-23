class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :category
      t.string :query
      t.string :start_language
      t.string :end_language
      t.timestamps
    end
  end
end
