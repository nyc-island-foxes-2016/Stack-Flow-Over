class Vote < ActiveRecord::Base
  validates   :value, presence: true

  belongs_to  :user
  belongs_to  :voteable, polymorphic: true
end
