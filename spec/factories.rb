FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Duke Farnsworth The {n}"}
    sequence(:username) { |n| "user-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    password_confirmation "password"

    # factory :user_with_questions do
    #   ignore do
    #     questions_count 5
    #   end

    #   after(:build) do |user, evaluator|
    #     user.questions = build_list(:questions, evaluator.questions_count, user: user)
    #   end
    # end
  end

  factory :question do 
    category_id {rand(1..6)}
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
    question_id 1
    user_id {rand(1..20)}
    delta "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}"
    vote_count {rand(1..10)}
  end


  factory :category do 
    name "Enumerable"
  end  

  factory :language do 
    name "Ruby"#, "JavaScript", "Java", "Python"].sample
  end  

end