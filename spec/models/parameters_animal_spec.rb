require 'rails_helper'

RSpec.describe ParametersAnimal, type: :model do
  describe '.animal_id' do
    subject { FactoryBot.build(:parameters_animal, animal_id: animal_id) }

    context 'when nil' do
      let(:animal_id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when invalid' do
      let(:animal_id) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let(:animal_id) { FactoryBot.create(:animal).id }

      it { is_expected.to be_valid }
    end
  end

  describe '.parameter_id' do
    subject { FactoryBot.build(:parameters_animal, parameter_id: parameter_id) }

    context 'when nil' do
      let(:parameter_id) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when invalid' do
      let(:parameter_id) { 99 }

      it { is_expected.not_to be_valid }
    end

    context 'when valid' do
      let(:parameter_id) { FactoryBot.create(:parameter).id }

      it { is_expected.to be_valid }
    end
  end
end
