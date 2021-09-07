# frozen_string_literal: true

RSpec.describe Api::V1::WalletsController, type: :request do
  describe 'GET /api/v1/wallets/current' do
    context 'when not authenticated' do
      it 'returns 401 UNAUTHORIZED' do
        get current_api_v1_wallets_path

        expect(response).to have_http_status(401)
      end
    end

    context 'when authenticated' do
      it 'returns current wallet entries' do
        user = create :user
        cycle = create :cycle, user: user, current: true
        wallet = create :wallet, cycle: cycle
        currency_1 = create :currency
        currency_2 = create :currency
        currency_3 = create :currency
        create :wallet_entry, wallet: wallet, currency: currency_1,
                              amount: 100.546545
        create :wallet_entry, wallet: wallet, currency: currency_2,
                              amount: 0.00000000007
        create :wallet_entry, wallet: wallet, currency: currency_3,
                              amount: 0.0005742

        get current_api_v1_wallets_path, headers: auth_header(user)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response_body['wallet_entries'].count).to eq(3)
      end
    end
  end
end
