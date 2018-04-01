class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :vote_answers

  validates :body, presence:true
  validates :body, length: { minimum: 15}

  def voted_answer_by?(user)
    vote_answers.exists?(user: user)
  end
end
