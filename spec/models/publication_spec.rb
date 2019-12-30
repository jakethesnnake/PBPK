require 'rails_helper'

RSpec.describe Publication, type: :model do
  describe '#mini_citation' do
    subject { publication.mini_citation }

    let!(:publication) { FactoryBot.create(:publication, year: "1998") }
    let!(:author) { FactoryBot.create(:author, name: "Jake") }
    let!(:author2) { FactoryBot.create(:author, name: "Luke") }

    context 'when 1 author' do
      before { FactoryBot.create(:author_publication, author_id: author.id, publication_id: publication.id) }

      it { expect(publication.authors).to include(author) }
      it { is_expected.to eq("Jake 1998") }

      context 'when 2 authors' do
        before { FactoryBot.create(:author_publication, author_id: author2.id, publication_id: publication.id) }

        it { expect(publication.authors).to include(author2) }
        it { is_expected.to eq("Jake 1998") }
      end
    end
  end

  describe '.year' do
    subject { FactoryBot.build(:publication, year: year) }

    context 'when nil' do
      let(:year) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when too early' do
      let(:year) { 1799 }

      it { is_expected.not_to be_valid }
    end

    context 'when earliest possible' do
      let(:year) { 1800 }

      it { is_expected.to be_valid }
    end

    context 'when current' do
      let(:year) { Date.today.year }

      it { is_expected.to be_valid }
    end

    context 'when future' do
      let(:year) { Date.today.year + 1 }

      it { is_expected.not_to be_valid }
    end

    context 'when string' do
      let(:year) { "Year" }

      it { is_expected.not_to be_valid }
    end
  end
end
