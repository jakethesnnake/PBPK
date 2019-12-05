require 'rails_helper'

RSpec.describe WeightPublication, type: :model do
  describe 'associations' do
    let!(:weight) { FactoryBot.create(:weight) }
    let!(:publication) { FactoryBot.create(:publication) }
    let!(:weight_publication) { FactoryBot.create(:weight_publication,
                                                  weight_id: weight.id,
                                                  publication_id: publication.id) }

    it { expect(weight_publication.publication).to eq(publication) }
    it { expect(weight_publication.weight).to eq(weight) }
  end

  describe '.publication_id' do
    subject { FactoryBot.build(:weight_publication, publication_id: id) }

    context 'when nil' do
      let(:id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when valid id' do
      let!(:id) { FactoryBot.create(:publication).id }

      it { is_expected.to be_valid }
    end
  end

  describe '.weight_id' do
    subject { FactoryBot.build(:weight_publication, weight_id: id) }

    context 'when nil' do
      let(:id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when valid id' do
      let!(:id) { FactoryBot.create(:weight).id }

      it { is_expected.to be_valid }
    end
  end
end
