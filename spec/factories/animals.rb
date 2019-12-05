FactoryBot.define do
  factory :animal do
    sequence(:name) { |n| "AnimalName#{n}" }
    parent_id { nil }
  end
end
