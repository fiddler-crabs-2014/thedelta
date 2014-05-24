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


  factory :answer do 
    sequence(:question_id) { |n| n}
    user_id {rand(1..20)}
    delta "{\"0\":[\"\",\"0\"],\"1\":[\"t\",\"1423\"],\"2\":[\"th\",\"1511\"]}"
    vote_count {rand(1..10)}
  end

  factory :question do 
    category_id {rand(1..6)}
    sequence(:query) { |n| "This is question #{n}" }
    start_language "Ruby"
    end_language "JavaScript"
  end  

end