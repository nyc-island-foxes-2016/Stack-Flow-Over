
FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    password {"password"}
  end

  factory :question do
    body { Faker::Lorem.sentence }
    user

    factory :q_with_answers do
      after(:create) do |question|
        create_list(:answer, 10, question: question)
      end
    end

    factory :q_with_comments do
      after(:create) do |question|
        create_list(:comment, 10, question: question)
      end
    end

  end

  factory :answer do
    body { Faker::Lorem.sentence }
    question
    user

    # factory :answer_with_comments do
    #   after(:create) do |question|
    #     create_list(:answer, 10, question: question)
    #   end
    # end
  end

  factory :comment do
    body { Faker::Lorem.sentence }

  end

end
