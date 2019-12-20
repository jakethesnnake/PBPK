require 'rails_helper'

RSpec.describe Parameter, type: :model do
  let!(:parameter) { FactoryBot.create(:parameter) }

  describe '#animal_list' do
    subject { parameter.animal_list }

    context 'when no animals' do
      it { is_expected.to eq([]) }
    end

    context 'when one animal' do
      let!(:a1) { FactoryBot.create(:animal) }
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: a1.id, parameter_id: parameter.id) }

      it { is_expected.to eq([a1]) }
    end

    context 'when two animals' do
      let!(:a1) { FactoryBot.create(:animal) }
      let!(:a2) { FactoryBot.create(:animal) }
      let!(:o1) { FactoryBot.create(:organ) }
      let!(:w1) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: a1.id, parameter_id: parameter.id) }
      let!(:w2) { FactoryBot.create(:weight, organ_id: o1.id, animal_id: a2.id, parameter_id: parameter.id) }

      it { is_expected.to eq([a1, a2]) }
    end
  end
end
