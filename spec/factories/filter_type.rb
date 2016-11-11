FactoryGirl.define do
  factory :filter_type do
    game
    sequence(:name) { |n| "fliter type #{n}" }
  end
end
