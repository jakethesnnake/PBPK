FactoryBot.define do
  factory :weight do
    organ_id { create(:organ).id }
    animal_id { create(:animal).id }
    mean { 99.99 }
    standard_deviation { 88.88 }
    sample_size { 45 }
    number_of_studies { 3 }
    reference_string { nil }
    parameter_id { create(:parameter).id }

    # (chicken/turkey)
    mean_male { nil }
    mean_female { nil }
    range { nil }
    production_class { nil }
  end
end
