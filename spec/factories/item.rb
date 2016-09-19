FactoryGirl.define do
  factory :item do
    bot
    game
    sequence(:steam_id) { |n| 1000 + n }
    classid { rand(10_000_000) }
    instanceid { rand(10_000_000) }
    amount 1
    raw 'raw'
  end
end
