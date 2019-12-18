require 'rails_helper'

RSpec.describe Parameter, type: :model do
  let!(:animal) { FactoryBot.create(:animal) }
  let!(:parameter) { FactoryBot.create(:parameter) }

  describe '#animals' do
    subject { parameter.animals }

    context 'when no animals' do
      it { is_expected.to eq([]) }
    end

    context 'when one animal' do
      before { animal.add_to_parameter(parameter) }

      it { is_expected.to include(animal) }
    end

    context 'when two animals' do
      let!(:a2) { FactoryBot.create(:animal) }

      before do
        animal.add_to_parameter(parameter)
        a2.add_to_parameter(parameter)
      end

      it { is_expected.to include(animal) }
      it { is_expected.to include(a2) }
    end
  end
end
