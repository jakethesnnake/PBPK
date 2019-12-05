require 'rails_helper'

RSpec.describe Publication, type: :model do
  describe '.year' do
    subject { FactoryBot.build(:publication, year: year) }

    context 'when nil' do
      let(:year) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when too early' do
      let(:year) { 1799 }

      it { is_expected.not_to be_valid }
    end

    context 'when earliest possible' do
      let(:year) { 1800 }

      it { is_expected.to be_valid }
    end

    context 'when current' do
      let(:year) { Date.today.year }

      it { is_expected.to be_valid }
    end

    context 'when future' do
      let(:year) { Date.today.year + 1 }

      it { is_expected.not_to be_valid }
    end

    context 'when string' do
      let(:year) { "Year" }

      it { is_expected.not_to be_valid }
    end
  end
end
