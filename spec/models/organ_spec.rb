require 'rails_helper'

RSpec.describe Organ, type: :model do
  describe '#is_child?' do
    subject { organ.is_child? }

    context 'when organ is child' do
      let!(:parent) { FactoryBot.create(:organ) }
      let!(:organ) { FactoryBot.create(:organ, parent_id: parent.id) }

      it { is_expected.to be_truthy }
    end

    context 'when organ is orphan' do
      let!(:organ) { FactoryBot.create(:organ) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#is_grandchild?' do
    subject { organ.is_grandchild? }

    context 'when organ is grandchild' do
      let!(:grandparent) { FactoryBot.create(:organ) }
      let!(:parent) { FactoryBot.create(:organ, parent_id: grandparent.id) }
      let!(:organ) { FactoryBot.create(:organ, parent_id: parent.id) }

      it { is_expected.to be_truthy }
    end

    context 'when organ is child' do
      let!(:parent) { FactoryBot.create(:organ) }
      let!(:organ) { FactoryBot.create(:organ, parent_id: parent.id) }

      it { is_expected.to be_falsey }
    end

    context 'when organ is orphan' do
      let!(:organ) { FactoryBot.create(:organ) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#organs_and_all_children(organs)' do
    subject { Organ.organs_and_all_children(organs) }

    let!(:organs) { [o1,o2] }
    let!(:o1) { FactoryBot.create(:organ) }
    let!(:o2) { FactoryBot.create(:organ) }

    context 'when three branches of organs' do
      let!(:o11) { FactoryBot.create(:organ, parent_id: o1.id) }
      let!(:o111) { FactoryBot.create(:organ, parent_id: o11.id) }
      let!(:o21) { FactoryBot.create(:organ, parent_id: o2.id) }
      let!(:o211) { FactoryBot.create(:organ, parent_id: o21.id) }

      it { is_expected.to include(o1) }
      it { is_expected.to include(o11) }
      it { is_expected.to include(o111) }
      it { is_expected.to include(o2) }
      it { is_expected.to include(o21) }
      it { is_expected.to include(o211) }
    end

    context 'when no children present' do
      it { is_expected.to include(o1) }
      it { is_expected.to include(o2) }
    end

    context 'when organs nil' do
      let(:organs) { nil }

      it { is_expected.to eq([]) }
    end
  end

  describe '#self.children(id)' do
    subject { Organ.children(id) }
    let(:id) { organ.id }
    let!(:organ) { FactoryBot.create(:organ) }

    context 'when no children' do
      it { is_expected.to eq([]) }
    end

    context 'when 1 child exists' do
      let!(:o1) { FactoryBot.create(:organ, parent_id: organ.id) }

      it { is_expected.to include(o1) }
      it { is_expected.not_to include(organ) }
    end

    context 'when 4 children exist (3 levels)' do
      let!(:o1) { FactoryBot.create(:organ, parent_id: organ.id) }
      let!(:o2) { FactoryBot.create(:organ, parent_id: o1.id) }
      let!(:o3) { FactoryBot.create(:organ, parent_id: o2.id) }
      let!(:o4) { FactoryBot.create(:organ, parent_id: o3.id) }

      it { is_expected.to include(o1) }
      it { is_expected.to include(o2) }
      it { is_expected.to include(o3) }
      it { is_expected.to include(o4) }
      it { is_expected.not_to include(organ) }
    end
  end

  describe '.name' do
    subject { FactoryBot.build(:organ, name: name) }

    context 'when nil' do
      let(:name) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when present' do
      let(:name) { "OrganName" }

      it { is_expected.to be_valid }
    end
  end

  describe '.parent_id' do
    subject { FactoryBot.build(:organ, parent_id: parent_id) }

    context 'valid category reference' do
      let!(:parent_id) { FactoryBot.create(:organ).id }

      it { is_expected.to be_valid }
    end

    context 'invalid category reference' do
      let(:parent_id) { 99 }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#parent' do
    subject { organ.parent }
    let!(:organ) { FactoryBot.create(:organ, parent_id: parent_id) }

    context 'when parent present' do
      let!(:parent) { FactoryBot.create(:organ) }
      let(:parent_id) { parent.id }

      it { is_expected.to eq(parent) }
    end

    context 'when category absent' do
      let(:parent_id) { nil }

      it { is_expected.to eq(nil) }
    end
  end
end