FactoryGirl.define do
  factory :item do
    bot
    game
    sequence(:steam_id) { |n| 1000 + n }
    classid { rand(10_000_000) }
    instanceid { rand(10_000_000) }
    amount 1
    raw 'raw'

    sequence(:name) { |n| "Item name##{n}" }
    sequence(:item_type) { |n| "Item type##{n}" }
    sequence(:description) { |n| "<div class='desc'> Item decription##{n} </div>" }
    icon_large_url 'test_large_url'
    icon_url 'test_url'
  end
end
