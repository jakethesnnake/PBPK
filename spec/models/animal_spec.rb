require 'rails_helper'

RSpec.describe Animal, type: :model do
  let!(:animal) { FactoryBot.create(:animal) }

  describe '.name' do
    subject { FactoryBot.build(:animal, name: name) }

    context 'when nil' do
      let(:name) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when present' do
      let(:name) { "AnimalName" }

      it { is_expected.to be_valid }
    end
  end

  describe '#organs' do
    subject { animal.organs }

    let!(:o1) { FactoryBot.create(:organ) }
    let!(:o2) { FactoryBot.create(:organ) }

    context 'when no organs' do
      it { is_expected.to eq([]) }
    end

    context 'when 1 organ' do
      let!(:o_w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id) }

      it { is_expected.to include(o1) }
    end

    context 'when 2 organs' do
      let!(:o_w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id) }
      let!(:o_w2) { FactoryBot.create(:weight, organ_id: o2.id, animal_id: animal.id) }

      it { is_expected.to include(o1) }
      it { is_expected.to include(o2) }
    end
  end

  describe '#is_child?' do
    subject { animal.is_child? }

    context 'when animal is child' do
      let!(:parent) { FactoryBot.create(:animal) }
      let!(:animal) { FactoryBot.create(:animal, parent_id: parent.id) }

      it { is_expected.to be_truthy }
    end

    context 'when animal is orphan' do
      let!(:animal) { FactoryBot.create(:animal) }

      it { is_expected.to be_falsey }
    end
  end

  describe '.parent_id' do
    subject { FactoryBot.build(:animal, parent_id: pid) }

    context 'when nil' do
      let(:pid) { nil }

      it { is_expected.to be_valid }
    end

    context 'when valid' do
      let!(:pid) { FactoryBot.create(:animal).id }

      it { is_expected.to be_valid }
    end

    context 'when invalid' do
      let(:pid) { 99 }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#parent' do
    subject { FactoryBot.create(:animal, parent_id: pid).parent }

    context 'when nil' do
      let(:pid) { nil }

      it { is_expected.to be_nil }
    end

    context 'when present' do
      let!(:animal) { FactoryBot.create(:animal) }
      let(:pid) { animal.id }

      it { is_expected.to eq(animal) }
    end
  end
end
