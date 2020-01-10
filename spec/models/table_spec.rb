require 'rails_helper'

RSpec.describe Table, type: :model do
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
