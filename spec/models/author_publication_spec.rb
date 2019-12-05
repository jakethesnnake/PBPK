require 'rails_helper'

RSpec.describe AuthorPublication, type: :model do
  describe 'associations' do
    let!(:author) { FactoryBot.create(:author) }
    let!(:publication) { FactoryBot.create(:publication) }
    let!(:author_publication) { FactoryBot.create(:author_publication, author_id: author.id, publication_id: publication.id) }

    it { expect(author_publication.author).to eq(author) }
    it { expect(author_publication.publication).to eq(publication) }
    it { expect(author.publications).to include(publication) }
    it { expect(publication.authors).to include(author) }
  end

  describe '.publication_id' do
    subject { FactoryBot.build(:author_publication, publication_id: publication_id) }

    context 'when valid' do
      let(:publication_id) { FactoryBot.create(:publication).id }

      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      let(:publication_id) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when nil' do
      let(:publication_id) { nil }

      it { is_expected.not_to be_valid }
    end
  end

  describe '.author_id' do
    subject { FactoryBot.build(:author_publication, author_id: author_id) }

    context 'when valid' do
      let(:author_id) { FactoryBot.create(:author).id }

      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      let(:author_id) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when nil' do
      let(:author_id) { nil }

      it { is_expected.not_to be_valid }
    end
  end
end
