require 'rails_helper'

RSpec.describe Weight, type: :model do
  describe 'associations' do
    let!(:animal) { FactoryBot.create(:animal) }
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:weight) { FactoryBot.create(:weight, animal_id: animal.id, organ_id: organ.id) }

    it { expect(weight.organ).to eq(organ) }
    it { expect(weight.animal).to eq(animal) }
  end

  describe '.parameter_id' do
    subject { FactoryBot.build(:weight, parameter_id: pid) }

    context 'when nil' do
      let(:pid) { nil }

      it { is_expected.to be_valid }
    end

    context 'when valid' do
      let!(:pid) { FactoryBot.create(:parameter).id }

      it { is_expected.to be_valid }
    end
  end

  describe '#organ_name' do
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:weight) { FactoryBot.create(:weight, organ_id: organ.id) }

    subject { weight.organ_name }

    it { is_expected.to eq(organ.name) }
  end

  describe '#animal_name' do
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:weight) { FactoryBot.create(:weight, organ_id: organ.id) }

    subject { weight.animal_name }

    it { is_expected.to eq(weight.animal.name) }
  end

  describe '.animal' do
    subject { FactoryBot.build(:weight, animal_id: animal_id) }
    let!(:animal) { FactoryBot.create(:animal) }

    context 'when valid id' do
      let(:animal_id) { animal.id }

      it { is_expected.to be_valid }
    end

    context 'when invalid id' do
      let(:animal_id) { 99 }

      it { is_expected.not_to be_valid }
    end
  end

  describe '.mean' do
    subject { FactoryBot.build(:weight, mean: mean) }

    context 'when valid' do
      let(:mean) { 99 }

      it { is_expected.to be_valid }
    end

    context 'when non-int' do
      let(:mean) { "Mean" }

      it { is_expected.not_to be_valid }
    end

    context 'when nil' do
      let(:mean) { nil }

      it { is_expected.to be_valid }
    end
  end
end
