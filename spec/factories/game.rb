FactoryGirl.define do
  factory :game do
    sequence(:app_id) { |n| n }
    sequence(:name) { |n| "Game ##{n}" }

    trait :published do
      published true
    end
  end
end
