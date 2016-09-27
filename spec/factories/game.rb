FactoryGirl.define do
  factory :game do
    sequence(:app_id) { |n| n }
    sequence(:name) { |n| "Game ##{n}" }
    published true

    trait :published do
      published true
    end

    trait :unpublished do
      published false
    end
  end
end
