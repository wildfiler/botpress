FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@foo.bar" }
    password '12345678'

    trait :admin do
      admin true
    end
  end
end
