require 'rails_helper'

RSpec.describe Weight, type: :model do
  describe 'associations' do
    let!(:animal) { FactoryBot.create(:animal) }
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:weight) { FactoryBot.create(:weight, animal_id: animal.id, organ_id: organ.id) }

    it { expect(weight.organ).to eq(organ) }
    it { expect(weight.animal).to eq(animal) }
  end

  describe '#add_list' do
    subject { weight.add_list }

    let(:weight) { FactoryBot.create(:weight, reference_string: str) }
    let!(:p1) { FactoryBot.create(:publication, reference_number: 1) }
    let!(:p2) { FactoryBot.create(:publication, reference_number: 2) }

    before { allow(weight).to receive(:add_reference_number_list) }

    context 'when no reference string' do
      let!(:str) { nil }

      it { expect(weight.all_reference_numbers).to eq([]) }
    end

    context 'when reference string of 1' do
      let(:str) { "1" }

      it { expect(weight.all_reference_numbers).to eq([1]) }
    end

    context 'when reference string of 2' do
      let(:str) { "1,2" }

      it { expect(weight.all_reference_numbers).to eq([1,2]) }
    end
  end

  describe '#add_reference_number_list' do
    let!(:weight) { FactoryBot.create(:weight) }
    subject { weight.add_reference_number_list(num_list) }

    context 'when nil' do
      let(:num_list) { nil }

      it { expect{ subject }.to raise_error( I18n.t('setup.errors.weight.nil_or_empty_list') ) }
    end

    context 'when empty' do
      let(:num_list) { [] }

      it { expect{ subject }.to raise_error( I18n.t('setup.errors.weight.nil_or_empty_list') ) }
    end

    context 'when invalid reference' do
      let(:num_list) { [1] }

      it { expect{ subject }.to raise_error( I18n.t('setup.errors.weight.invalid_reference') ) }
    end

    context 'when one valid reference' do
      let!(:p1) { FactoryBot.create(:publication, reference_number: 1) }
      let(:num_list) { [1] }

      before { subject }

      it { expect(WeightPublication.find_by(weight_id: weight.id, publication_id: p1.id)).not_to be_nil }
    end

    context 'when two valid references' do
      let!(:p1) { FactoryBot.create(:publication, reference_number: 1) }
      let!(:p2) { FactoryBot.create(:publication, reference_number: 2) }
      let(:num_list) { [1,2] }

      before { subject }

      it { expect(WeightPublication.find_by(weight_id: weight.id, publication_id: p1.id)).not_to be_nil }
      it { expect(WeightPublication.find_by(weight_id: weight.id, publication_id: p2.id)).not_to be_nil }
      it { expect(weight.all_reference_numbers).to include(1) }
      it { expect(weight.all_reference_numbers).to include(2) }
    end
  end

  describe '#all_reference_numbers' do
    let!(:weight) { FactoryBot.create(:weight) }

    let!(:p1) { FactoryBot.create(:publication, reference_number: 1) }
    let!(:p2) { FactoryBot.create(:publication, reference_number: 2) }

    subject { weight.all_reference_numbers }

    context 'when no reference numbers' do
      it { is_expected.to eq([]) }
    end

    context 'when 1 reference number' do
      let(:num_list) { [1] }

      before { weight.add_reference_number_list(num_list) }

      it { is_expected.to include(1) }
      it { is_expected.not_to include(2) }
    end

    context 'when 2 reference numbers' do
      let(:num_list) { [1,2] }

      before { weight.add_reference_number_list(num_list) }

      it { is_expected.to include(1) }
      it { is_expected.to include(2) }
    end
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

  describe '#add_publication && #publications' do
    let!(:weight) { FactoryBot.create(:weight) }
    let!(:p1) { FactoryBot.create(:publication) }
    let!(:p2) { FactoryBot.create(:publication) }

    subject { weight.publications }

    before do
      weight.add_publication(p1)
      weight.add_publication(p2)
    end

    it { is_expected.to include(p1) }
    it { is_expected.to include(p2) }
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
