require 'rails_helper'

RSpec.describe Animal, type: :model do
  let!(:animal) { FactoryBot.create(:animal) }

  describe '#add_to_parameter' do
    subject { animal.add_to_parameter(parameter) }

    context 'when nil' do
      let(:parameter) { nil }

      it { expect { subject }.to raise_error }
    end

    context 'when valid (create)' do
      let(:parameter) { FactoryBot.create(:parameter) }

      it { subject ; expect(ParametersAnimal.find_by(parameter_id: parameter.id, animal_id: animal.id)).not_to be(nil) }
    end

    context 'when valid (find)' do
      let(:parameter) { param }
      let!(:param) { FactoryBot.create(:parameter) }

      before { subject }

      it { expect(ParametersAnimal.find_by(parameter_id: param.id, animal_id: animal.id)).not_to be(nil) }
      it { expect(ParametersAnimal.count).to eq(1) }
    end
  end

  describe '#sort_animal_list' do
    subject { Animal.sort_animal_list(animals) }

    let!(:a1) { FactoryBot.create(:animal) }
    let!(:a2) { FactoryBot.create(:animal, parent_id: a1.id) }
    let!(:a3) { FactoryBot.create(:animal, parent_id: a2.id) }


    # goal: { a1, a2, a3 }

    context 'when list nil' do
      let(:animals) { nil }

      it { is_expected.to eq([]) }
    end

    context 'when list empty' do
      let(:animals) { [] }

      it { is_expected.to eq([]) }
    end

    context 'when list in order' do
      let(:animals) { [a1,a2,a3] }

      it { is_expected.to eq([a1,a2,a3]) }
    end

    context 'when list out of order' do
      let(:animals) { [a1,a3,a2] }

      it { is_expected.to eq([a1,a2,a3]) }
    end

    context 'when list in reverse' do
      let(:animals) { [a3,a2,a1] }

      it { is_expected.to eq([a1,a2,a3]) }
    end

    context 'when 5 animals' do
      let(:animals) { [a1,a2,a3,a4,a5] }
      let!(:a4) { FactoryBot.create(:animal, parent_id: a1.id) }
      let!(:a5) { FactoryBot.create(:animal, parent_id: a2.id) }

      it { is_expected.to eq([a1,a2,a3,a5,a4]) }
    end

    context 'when 6 animals' do
      let(:animals) { [a1,a6,a2,a3,a4,a5] }
      let!(:a4) { FactoryBot.create(:animal, parent_id: a1.id) }
      let!(:a5) { FactoryBot.create(:animal, parent_id: a2.id) }
      let!(:a6) { FactoryBot.create(:animal) }

      it { is_expected.to eq([a1,a2,a3,a5,a4,a6]) }
    end
  end

  describe '#self_and_descendants' do
    subject { animal.self_and_descendants }

    context 'when no descendants' do
      it { is_expected.to eq([animal]) }
    end

    context 'when one descendant' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }

      it { is_expected.to eq([animal, c1]) }
    end

    context 'when two descendants' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c2) { FactoryBot.create(:animal, parent_id: animal.id) }

      it { is_expected.to eq([animal, c1, c2]) }
    end

    context 'when two generations' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c2) { FactoryBot.create(:animal, parent_id: c1.id) }

      it { is_expected.to eq([animal, c1, c2]) }
    end

    context 'when two generations (larger)' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c2) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c3) { FactoryBot.create(:animal, parent_id: c1.id) }
      let!(:c4) { FactoryBot.create(:animal, parent_id: c2.id) }

      it { is_expected.to eq([animal, c1, c3, c2, c4]) }
    end
    context 'when multiple grandchildren' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c2) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c3) { FactoryBot.create(:animal, parent_id: c1.id) }
      let!(:c4) { FactoryBot.create(:animal, parent_id: c1.id) }

      it { is_expected.to eq([animal, c1, c3, c4, c2]) }
    end
  end

  describe '#children' do
    subject { animal.children }

    context 'when none' do
      it { is_expected.to eq([]) }
    end

    context 'when one' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }

      it { is_expected.to include(c1) }
    end

    context 'when one' do
      let!(:c1) { FactoryBot.create(:animal, parent_id: animal.id) }
      let!(:c2) { FactoryBot.create(:animal, parent_id: animal.id) }

      it { is_expected.to include(c1) }
      it { is_expected.to include(c2) }
    end
  end

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
