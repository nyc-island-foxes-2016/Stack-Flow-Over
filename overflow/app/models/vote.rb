class Vote < ActiveRecord::Base
  validates   :vote_type, presence: true

  belongs_to  :user
  belongs_to  :voteable, polymorphic: true

  def has_voted?(args)
    !!Vote.where(voteable_type: args[:voteable_type], voteable_id: args[:voteable_id]).find_by(user_id: args[:user_id])
  end

  # def vote_question(args)
  #   id = Vote.where(voteable_type: args[:voteable_type], voteable_id: args[:voteable_id], user_id: args[:user_id]).question.id
  # end
end
