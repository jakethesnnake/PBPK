FactoryBot.define do
  factory :organ do
    sequence(:name) { |n| "OrganName#{n}" }
    parent_id { nil }
  end
end
