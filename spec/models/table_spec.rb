require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'associations' do
    subject { table.citation_by_ref_num(number) }

    let!(:table) { FactoryBot.create(:table) }
    let!(:citation) { FactoryBot.create(:citation) }
    before { FactoryBot.create(:table_citation, table_id: table.id, citation_id: citation.id, reference_number: 1) }

    context 'when ref num valid' do
      let(:number) { 1 }

      it { is_expected.to eq(citation) }
    end

    context 'when ref num nil' do
      let(:number) { nil }

      it { is_expected.to be_nil }
    end

    context 'when ref num invalid' do
      let(:number) { 99 }

      it { is_expected.to be_nil }
    end
  end

  describe '#animal' do
    subject { table.animal }
    let!(:table) { FactoryBot.create(:table) }

    it { is_expected.to eq(Animal.find_by_id(table.animal_id)) }
  end

  describe '#parameter' do
    subject { table.parameter }
    let!(:table) { FactoryBot.create(:table) }

    it { is_expected.to eq(Parameter.find_by_id(table.parameter_id)) }
  end

  describe '.animal2_id' do
    subject { FactoryBot.build(:table, animal2_id: aid) }

    context 'when nil' do
      let(:aid) { nil }

      it { is_expected.to be_valid }
    end

    context 'when present' do
      let(:aid) { FactoryBot.create(:animal).id }

      it { is_expected.to be_valid }
    end
  end

  describe '.parameter_id' do
    subject { FactoryBot.build(:table, parameter_id: pid) }

    context 'when nil' do
      let(:pid) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when invalid' do
      let(:pid) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let(:pid) { FactoryBot.create(:parameter).id }

      it { is_expected.to be_valid }
    end
  end

  describe '.animal_id' do
    subject { FactoryBot.build(:table, animal_id: aid) }

    context 'when nil' do
      let(:aid) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when invalid' do
      let(:aid) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let(:aid) { FactoryBot.create(:animal).id }

      it { is_expected.to be_valid }
    end
  end
end
