require 'rails_helper'

RSpec.describe WeightHelper, type: :helper do
  describe '#mean_info(weight)' do
    subject { mean_info(weight) }

    context 'whe nil' do
      let(:weight) { nil }

      it { is_expected.to be_nil }
    end

    context 'when standard weight' do
      let!(:weight) { FactoryBot.create(:weight, mean: 22) }

      it { is_expected.to eq(22) }
    end

    context 'when male only' do
      let!(:weight) { FactoryBot.create(:weight, mean: nil, mean_male: 20.5) }

      it { is_expected.to match("(male only)") }
    end

    context 'when male only' do
      let!(:weight) { FactoryBot.create(:weight, mean: nil, mean_female: 20.5) }

      it { is_expected.to match("(female only)") }
    end

    context 'when both' do
      let!(:weight) { FactoryBot.create(:weight, mean: nil, mean_female: 20.5, mean_male: 10.5) }

      it { is_expected.to match("(male)") }
      it { is_expected.to match("(female)") }
    end
  end

  describe '#has_production_class_info?(animal)' do
    subject { has_production_class_info?(animal) }

    let(:animal) { FactoryBot.create(:animal) }
    let!(:organ) { FactoryBot.create(:organ) }
    let!(:param) { FactoryBot.create(:parameter, id: 2) }

    context 'when animal nil' do
      let(:animal) { nil }

      it { is_expected.to be_falsy }
    end

    context 'when animal has production class info' do
      before { FactoryBot.create(:weight, parameter_id: param.id, organ_id: organ.id, animal_id: animal.id, production_class: nil) }

      it { is_expected.to be_falsy }
    end

    context 'when animal has production class info' do
      before { FactoryBot.create(:weight, parameter_id: param.id, organ_id: organ.id, animal_id: animal.id, production_class: "data") }

      it { is_expected.to be_truthy }
    end
  end
end
