require 'rails_helper'

RSpec.describe Citation, type: :model do
  let(:all_text) {
    "Abu-Tarboush, H. M., Al-Saiady, M. Y., & Keir El-Din, A. H. (1996). Evaluation of diet containing lactobacilli on performance, fecal coliform, and lactobacilli of young dairy calves. Animal Feed Science and Technology, 57(1), 39-49. doi:https://doi.org/10.1016/0377-8401(95)00850-0"
  }

  describe '.all_text' do
    subject { FactoryBot.build(:citation, all_text: all_text) }

    context 'when valid' do
      it { is_expected.to be_valid }
    end

    context 'when nil' do
      let(:all_text) { nil }
      
      it { is_expected.not_to be_valid }
    end
  end

  describe '#parse_author_name' do
    subject { Citation.parse_author_name(all_text) }

    context 'when valid' do
      it { is_expected.to eq('Abu-Tarboush') }
    end

    context 'when nil' do
      let(:all_text) { nil }

      it { is_expected.to be_nil }
    end
  end

  describe '#parse_year' do
    subject { Citation.parse_year(all_text) }

    context 'when standard year' do
      it { is_expected.to eq(1996) }
    end

    context 'when year has letter' do
      let(:all_text) {
        "Abu-Tarboush, H. M., Al-Saiady, M. Y., & Keir El-Din, A. H. (1996a). Evaluation of diet containing lactobacilli on performance, fecal coliform, and lactobacilli of young dairy calves. Animal Feed Science and Technology, 57(1), 39-49. doi:https://doi.org/10.1016/0377-8401(95)00850-0"
      }

      it { is_expected.to eq(1996) }
    end

    context 'when nil' do
      let(:all_text) { nil }

      it { is_expected.to be_nil }
    end
  end

  describe 'default values' do
    subject(:citation) { FactoryBot.create(:citation) }

    it { expect(citation.author_id).not_to be_nil }
    it { expect(citation.year).not_to be_nil }
    it { subject ; expect(Author.count).not_to eq(0) }
  end
end
