require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:animal) { FactoryBot.create(:animal) }

  describe "GET #index" do
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
  end
end
