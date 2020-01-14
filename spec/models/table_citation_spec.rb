require 'rails_helper'

RSpec.describe TableCitation, type: :model do
  describe '.table_id' do
    subject { FactoryBot.build(:table_citation, table_id: id) }

    context 'when nil' do
      let(:id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let!(:id) { FactoryBot.create(:table).id }

      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      let(:id) { 99 }

      it { is_expected.not_to be_valid }
    end
  end

  describe '.citation_id' do
    subject { FactoryBot.build(:table_citation, citation_id: id) }

    context 'when nil' do
      let(:id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let!(:id) { FactoryBot.create(:citation).id }

      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      let(:id) { 99 }

      it { is_expected.not_to be_valid }
    end
  end

  describe '.reference_number' do
    subject { FactoryBot.build(:table_citation, reference_number: num) }

    context 'when nil' do
      let(:num) { nil }

      it { is_expected.to be_valid }
    end

    context 'when present' do
      let(:num) { 1 }

      it { is_expected.to be_valid }
    end
  end
end
