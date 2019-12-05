FactoryBot.define do
  factory :author_publication do
    author_id { create(:author).id }
    publication_id { create(:publication).id }
  end
end
