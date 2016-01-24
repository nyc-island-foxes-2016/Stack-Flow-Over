class Question < ActiveRecord::Base
  validates   :body, presence: true

  belongs_to  :user
  belongs_to  :best_answer, class_name: 'Answer'

  has_many    :answers
  has_many    :comments, as: :commentable
  has_many    :votes, as: :voteable
end
