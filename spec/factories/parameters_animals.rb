FactoryBot.define do
  factory :parameters_animal do
    parameter_id { create(:parameter).id }
    animal_id { create(:animal).id }
  end
end
