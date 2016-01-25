class User < ActiveRecord::Base
  has_secure_password

  # has_secure_password will ensure password is present so this is redundant
  validates :name, :password_digest, presence: true

  has_many  :questions
  has_many  :answers
  has_many  :comments
  has_many  :votes
end
