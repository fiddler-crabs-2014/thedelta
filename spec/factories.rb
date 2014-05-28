FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Duke Farnsworth The {n}"}
    sequence(:username) { |n| "user-#{n}" }
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

  factory :admin do
    sequence(:name) { |n| "Duke Farnsworth The {n}"}
    sequence(:username) { |n| "user-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    password_confirmation "password"
    admin true

    # factory :admin_with_answers do
    #   ignore do
    #     questions_count 5
    #   end

    #   after(:build) do |user, evaluator|
    #     user.questions = build_list(:questions, evaluator.questions_count, user: user)
    #   end
    # end
  end

  factory :question do 
    association :category, factory: :category
    sequence(:query) { |n| "This is question #{n}" }
    start_language "Ruby"
    end_language "JavaScript"

    # factory :question_with_answer do
    #   after_create do |question|
    #     create(:answer, question: question)
    #   end
    # end
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
    name "Ruby"#, "JavaScript", "Java", "Python"].sample
  end  

end