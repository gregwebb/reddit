class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent, polymorphic: true
  has_many :votes, as: :parent
  has_many :comments, as: :parent
  validates :body, presence: true, length: { minimum: 1}

  def vote_total
    self.upvotes + self.downvotes
  end

  def score_total
    self.upvotes - self.downvotes
  end

  def upvotes
    self.votes.where(score: 1).size
  end

  def downvotes
    self.votes.where(score: -1).size
  end
end
