FactoryBot.define do
  factory :table do
    animal_id { create(:animal).id }
    parameter_id { create(:parameter).id }
    animal2_id { nil }
  end
end
