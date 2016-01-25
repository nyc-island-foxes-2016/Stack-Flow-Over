class Comment < ActiveRecord::Base
  validates   :body, presence: true

  belongs_to  :user
  belongs_to  :commentable, polymorphic: true

  has_many    :votes, as: :voteable

  #maybe vote_value would have been a better name
  def vote_score
    self.votes.sum(:vote_type)
  end
end
