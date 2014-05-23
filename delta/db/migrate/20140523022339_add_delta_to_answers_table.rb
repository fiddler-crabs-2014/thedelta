class AddDeltaToAnswersTable < ActiveRecord::Migration
  def change
    add_column :answers, :delta, :string
  end
end
