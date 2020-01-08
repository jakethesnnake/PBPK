FactoryBot.define do
  factory :citation do
    all_text {
      "Abu-Tarboush, H. M., Al-Saiady, M. Y., & Keir El-Din, A. H. (1996). Evaluation of diet containing lactobacilli on performance, fecal coliform, and lactobacilli of young dairy calves. Animal Feed Science and Technology, 57(1), 39-49. doi:https://doi.org/10.1016/0377-8401(95)00850-0"
    }
    author_id { nil }
    year { nil }
  end
end