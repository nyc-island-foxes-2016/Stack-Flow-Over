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
  answer = Answer.create(body: Faker::Lorem.sentence, question_id: Question.all.sample.id, user_id: User.all.sample.id)
end



