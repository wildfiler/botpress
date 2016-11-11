FactoryGirl.define do
  factory :bot do
    account
    sequence(:steam_id) { |n| n }
    sequence(:name) { |n| "bot ##{n}" }
  end
end
