class CreateVoteAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_answers do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
