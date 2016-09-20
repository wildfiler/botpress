FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@foo.bar" }
    password '12345678'
  end
end
