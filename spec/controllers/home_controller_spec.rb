require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:animal1) { FactoryBot.create(:animal) }
  let!(:animal2) { FactoryBot.create(:animal) }

  let!(:param1) { FactoryBot.create(:parameter) }
  let!(:param2) { FactoryBot.create(:parameter) }

  describe "GET #index" do
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
  end

  describe 'GET #filter' do
    subject { get :filter, params: { animal_id: animal_id, parameter_id: parameter_id } }
    let(:animal_id) { 2 }
    let(:parameter_id) { 2 }

    context 'when both ids provided' do
      it { subject ; expect(controller.instance_variable_get(:@animal)).to eq(Animal.find_by_id(2)) }
      it { subject ; expect(controller.instance_variable_get(:@parameter)).to eq(Parameter.find_by_id(2)) }
    end

    context 'when animal id nil' do
      let(:animal_id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end

    context 'when parameter id nil' do
      let(:parameter_id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe '#filter' do
    subject { post :filter, params: { animal_id: animal_id, parameter_id: parameter_id } }

    let!(:animal) { FactoryBot.create(:animal) }
    let!(:parameter) { FactoryBot.create(:parameter) }

    context 'when valid parameters' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { parameter.id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when animal_id nil' do
      let(:animal_id) { nil }
      let(:parameter_id) { parameter.id }

      it { is_expected.to redirect_to(root_url) }
    end

    context 'when animal_id nil' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe '#set_animal' do
    subject { post :set_animal, params: { animal_id: animal_id, parameter_id: parameter_id } }

    let!(:animal) { FactoryBot.create(:animal) }
    let!(:parameter) { FactoryBot.create(:parameter) }

    context 'when valid parameters' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { parameter.id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when animal_id nil' do
      let(:animal_id) { nil }
      let(:parameter_id) { parameter.id }

      it { is_expected.to redirect_to(root_url) }
    end

    context 'when parameter_id nil' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { nil }

      it { is_expected.to have_http_status(:success) }
    end
  end

  describe '#set_parameter' do
    subject { post :set_parameter, params: { animal_id: animal_id, parameter_id: parameter_id } }

    let!(:animal) { FactoryBot.create(:animal) }
    let!(:parameter) { FactoryBot.create(:parameter) }

    context 'when valid parameters' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { parameter.id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when animal_id nil' do
      let(:animal_id) { nil }
      let(:parameter_id) { parameter.id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when parameter_id nil' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end
  end

  describe '#empty' do
    subject { post :empty, params: { animal_id: animal_id, parameter_id: parameter_id } }

    let!(:animal) { FactoryBot.create(:animal) }
    let!(:parameter) { FactoryBot.create(:parameter) }

    context 'when valid parameters' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { parameter.id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when animal_id nil' do
      let(:animal_id) { nil }
      let(:parameter_id) { parameter.id }

      it { is_expected.to redirect_to(root_url) }
    end

    context 'when parameter_id nil' do
      let(:animal_id) { animal.id }
      let(:parameter_id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end
  end
end
