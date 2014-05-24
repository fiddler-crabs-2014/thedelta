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

end