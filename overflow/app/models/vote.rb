class Vote < ActiveRecord::Base
  belongs_to :voteable
end
