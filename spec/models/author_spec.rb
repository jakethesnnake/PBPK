require 'rails_helper'

RSpec.describe Author, type: :model do
  describe '.name' do
    subject { FactoryBot.build(:author, name: name) }

    context 'when name nil' do
      let(:name) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when name present' do
      let(:name) { "Name" }

      it { is_expected.to be_valid }
    end
  end
end
