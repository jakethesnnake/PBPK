require 'rails_helper'

RSpec.describe Animal, type: :model do
  let!(:animal) { FactoryBot.create(:animal) }

  let!(:p1) { FactoryBot.create(:parameter, id: 1) }
  let!(:p2) { FactoryBot.create(:parameter, id: 2) }

  describe '#has_range_info?' do
    subject { animal.has_range_info?(p1) }

    let!(:organ) { FactoryBot.create(:organ) }

    context 'when range info exists' do
      let!(:weight) { FactoryBot.create(:weight, parameter_id: p1.id, animal_id: animal.id, organ_id: organ.id, range: "range") }

      it { is_expected.to be_truthy }
    end

    context 'when range info does not exist' do
      let!(:weight) { FactoryBot.create(:weight, parameter_id: p1.id, animal_id: animal.id, organ_id: organ.id, range: nil) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#organs_for_parameter' do
    subject { animal.organs_for_parameter(parameter) }
    let(:parameter) { p1 }

    context 'when none' do
      it { is_expected.to eq([]) }
    end

    context 'when invalid parameter' do
      let(:parameter) { nil }

      it { is_expected.to be_nil }
    end

    context 'when one' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: p1.id) }

      it { is_expected.to eq([o1]) }
    end

    context 'when one (but one for different param)' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:o2) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: p1.id) }
      let!(:w2) { FactoryBot.create(:weight, organ_id: o2.id, animal_id: animal.id, parameter_id: p2.id) }

      it { is_expected.to eq([o1]) }
    end

    context 'when two' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:o2) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: p1.id) }
      let!(:w2) { FactoryBot.create(:weight, organ_id: o2.id, animal_id: animal.id, parameter_id: p1.id) }

      it { is_expected.to eq([o1, o2]) }
    end
  end

  describe '#parameters' do
    subject { params }
    let(:params) { animal.parameters }

    context 'when none' do
      it { expect(params).to eq([]) }
    end

    context 'when one' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: 1) }

      it { expect(params).to eq([p1]) }
    end

    context 'when two' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: 1) }
      let!(:w2) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: 2) }

      it { expect(params).to eq([p1, p2]) }
    end

    context 'when id 5 only' do
      let!(:p5) { FactoryBot.create(:parameter, id: 5) }
      let!(:w1) { FactoryBot.create(:weight, parameter_id: 5, animal_id: animal.id) }

      it { expect(params).to eq([p5]) }
    end
  end

  describe '#hemat_data' do
    subject { animal.hemat_data }

    context 'when data' do
      let!(:p5) { FactoryBot.create(:parameter, id: 5) }
      let!(:w1) { FactoryBot.create(:weight, animal_id: animal.id, parameter_id: 5) }

      it { is_expected.to include(w1) }
    end

    context 'when no data' do
      it { is_expected.to eq([]) }
    end
  end

  describe '#has_parameter_data?' do
    subject { animal.has_parameter_data?(parameter) }
    let(:parameter) { p1 }

    context 'when no data present' do
      it { is_expected.to be_falsey }
    end

    context 'when data for p1' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: 1) }

      context 'when p1 is param' do
        it { is_expected.to be_truthy }
      end

      context 'when p2 is param' do
        let(:parameter) { p2 }

        it { is_expected.to be_falsey }
      end
    end

    context 'when data for p2' do
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: animal.id, parameter_id: 2) }


      context 'when p1 is param' do
        it { is_expected.to be_falsey }
      end

      context 'when p2 is param' do
        let(:parameter) { p2 }

        it { is_expected.to be_truthy }
      end
    end

    context 'when data for p5' do
      let!(:p5) { FactoryBot.create(:parameter, id: 5) }
      let!(:w1) { FactoryBot.create(:weight, parameter_id: 5, animal_id: animal.id) }


      context 'when p1 is param' do
        it { is_expected.to be_falsey }
      end

      context 'when p5 is param' do
        let!(:parameter) { p5 }

        it { is_expected.to be_truthy }
      end
    end
  end

  describe '#weights_for_parameter' do
    subject { animal.weights_for_parameter(parameter) }

    let(:parameter) { p1 }

    let!(:p1) { FactoryBot.create(:parameter) }
    let!(:p2) { FactoryBot.create(:parameter) }

    context 'when none exist' do
      it { is_expected.to eq([]) }
    end

    context 'when one exists' do
      let!(:w1) { FactoryBot.create(:weight, parameter_id: p1.id, animal_id: animal.id) }
      let!(:w2) { FactoryBot.create(:weight, parameter_id: p2.id, animal_id: animal.id) }

      it { is_expected.to include(w1) }
      it { is_expected.not_to include(w2) }
    end

    context 'when two exist' do
      let!(:w1) { FactoryBot.create(:weight, parameter_id: p1.id, animal_id: animal.id) }
      let!(:w2) { FactoryBot.create(:weight, parameter_id: p1.id, animal_id: animal.id) }

      it { is_expected.to include(w1) }
      it { is_expected.to include(w2) }
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
