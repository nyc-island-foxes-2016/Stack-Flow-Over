require 'faker'
require 'pry'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

5.times do
  user = User.create(name: Faker::Name.first_name, password: "password")
  3.times do
    user.questions.create(body: Faker::Lorem.sentence)
  end
end


5.times do
  Answer.create(body: Faker::Lorem.sentence, question_id: Question.all.sample.id, user_id: User.all.sample.id)
end

3.times do
  Comment.create(body: Faker::Lorem.sentence, user_id: User.all.sample.id, commentable_id: Question.all.sample.id, commentable_type: "Question" )
  Comment.create(body: Faker::Lorem.sentence, user_id: User.all.sample.id, commentable_id: Answer.all.sample.id, commentable_type: "Answer" )
end





