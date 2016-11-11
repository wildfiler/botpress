FactoryGirl.define do
  factory :filter_value do
    filter_type
    sequence(:value) { |n| "fliter value #{n}" }
  end
end
