FactoryBot.define do
  factory :weight_publication do
    weight_id { create(:weight).id }
    publication_id { create(:publication).id }
  end
end
