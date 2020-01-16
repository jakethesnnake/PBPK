require 'rails_helper'

RSpec.describe Weight, type: :model do
  describe 'associations' do
    let!(:animal) { FactoryBot.create(:animal) }
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:weight) { FactoryBot.create(:weight, animal_id: animal.id, organ_id: organ.id) }

    it { expect(weight.organ).to eq(organ) }
    it { expect(weight.animal).to eq(animal) }
  end

  describe '#citations' do
    subject { weight.citations }
    let!(:weight) { FactoryBot.create(:weight, reference_string: list) }

    context 'when no citations' do
      let(:list) { nil }

      it { is_expected.to eq([]) }
    end

    context 'when one citation' do
      let(:list) { "1" }

      let!(:c1) { FactoryBot.create(:citation) }
      let!(:t1) { FactoryBot.create(:table) }

      before do
        FactoryBot.create(:table_citation, table_id: t1.id, citation_id: c1.id, reference_number: 1)
        allow(weight).to receive(:table).and_return(t1)
      end

      it { is_expected.to eq([c1]) }
    end

    context 'when two citations' do
      let(:list) { "1,2" }

      let!(:c1) { FactoryBot.create(:citation) }
      let!(:c2) { FactoryBot.create(:citation) }
      let!(:t1) { FactoryBot.create(:table) }

      before do
        FactoryBot.create(:table_citation, table_id: t1.id, citation_id: c1.id, reference_number: 1)
        FactoryBot.create(:table_citation, table_id: t1.id, citation_id: c2.id, reference_number: 2)
        allow(weight).to receive(:table).and_return(t1)
      end

      it { is_expected.to include(c1) }
      it { is_expected.to include(c2) }
    end
  end

  describe '#reference_number_list' do
    subject { weight.reference_number_list }
    let!(:weight) { FactoryBot.create(:weight, reference_string: list) }

    context 'when no refs' do
      let(:list) { nil }

      it { is_expected.to eq([]) }
    end

    context 'when one ref' do
      let(:list) { "1" }

      it { is_expected.to eq([1]) }
    end

    context 'when many refs (commas)' do
      let(:list) { "1,2,3" }

      it { is_expected.to eq([1,2,3]) }
    end

    context 'when many refs (dash)' do
      let(:list) { "1-3" }

      it { is_expected.to eq([1,2,3]) }
    end

    context 'when many refs (both)' do
      let(:list) { "1,2-5,6" }

      it { is_expected.to eq([1,2,3,4,5,6]) }
    end
  end

  describe '#reference_list_to_int_array' do
    subject { Weight.reference_list_to_int_array(list) }

    context 'when nil' do
      let(:list) { nil }

      it { is_expected.to eq([]) }
    end

    context 'when one number' do
      let(:list) { "1" }

      it { is_expected.to eq([1]) }
    end

    context 'when 3 numbers' do
      let(:list) { "1,2,3" }

      it { is_expected.to eq([1,2,3]) }
    end

    context 'when dash only' do
      let(:list) { "1-3" }

      it { is_expected.to eq([1,2,3]) }
    end

    context 'when dash and commas (dash in middle)' do
      let(:list) { "1,3-5,7" }

      it { is_expected.to eq([1,3,4,5,7]) }
    end

    context 'when commas and dash (comma in middle)' do
      let(:list) { "1-3,4,6-9" }

      it { is_expected.to eq([1,2,3,4,6,7,8,9]) }
    end
  end

  describe '.parameter_id' do
    subject { FactoryBot.build(:weight, parameter_id: pid) }

    context 'when nil' do
      let(:pid) { nil }

      it { is_expected.not_to be_valid }
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
