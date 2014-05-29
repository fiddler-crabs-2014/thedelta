FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Duke Farnsworth The #{n}"}
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    password_confirmation "password"
    admin false

    factory :user_with_answers do
      ignore do
        answers_count 10
      end

      after(:build) do |user, evaluator|
        user.answers = build_list(:answer_dynamic, evaluator.answers_count, user: user)
      end
    end
  end

  factory :admin, class: User do
    sequence(:name) { |n| "Duke Farnsworth The {n}"}
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    password_confirmation "password"
    admin true
  end

  factory :question do 
    association :category, factory: :category
    sequence(:query) { |n| "This is question #{n}" }
    start_language "Ruby"
    end_language "JavaScript"
  end


  factory :answer do
    association :question, factory: :question 
    association :user, factory: :user
    delta "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}"
  end

  factory :category do 
    name "Enumerables"
  end  

  factory :language do 
    name "Ruby"
  end  

end