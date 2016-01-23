class Vote < ActiveRecord::Base
  validates   :vote_type, presence: true

  belongs_to  :user
  belongs_to  :voteable, polymorphic: true
end
