FactoryBot.define do
  factory :table_citation do
    table_id { create(:table).id }
    citation_id { create(:citation).id }
    reference_number { nil }
    volume { nil }
  end
end
