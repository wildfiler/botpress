FactoryGirl.define do
  factory :bot do
    account
    sequence(:steam_id) { |n| n }
  end
end
