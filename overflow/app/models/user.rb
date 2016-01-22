class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password_digest, presence: true

  has_many  :questions, :answers, :comments, :votes
end
