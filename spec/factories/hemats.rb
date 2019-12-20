FactoryBot.define do
  factory :hemat do
    animal_id { create(:animal).id }
    mean { 33 }
    standard_deviation { 22 }
    sample_size { 10 }
    number_of_studies { 1 }
    body_weight { nil }
  end
end