require 'rails_helper'

RSpec.describe ReferencesController, type: :controller do
  describe "GET #show" do
    subject { get :show, params: { id: id } }

    context 'when valid id' do
      let!(:id) { FactoryBot.create(:weight).id }

      it { is_expected.to have_http_status(:success) }
    end

    context 'when invalid id' do
      let!(:id) { 99 }

      it { is_expected.to redirect_to(root_url) }
    end

    context 'when nil id' do
      let!(:id) { nil }

      it { is_expected.to redirect_to(root_url) }
    end
  end
end
