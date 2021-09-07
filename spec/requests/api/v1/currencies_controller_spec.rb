# frozen_string_literal: true

RSpec.describe Api::V1::CurrenciesController, type: :request do
  describe 'GET /api/v1/currencies' do
    context 'when not authenticated' do
      it 'returns 401 UNAUTHORIZED' do
        get api_v1_currencies_path

        expect(response).to have_http_status(401)
      end
    end

    context 'when authenticated' do
      it 'returns paginated currencies' do
        user = create :user
        create_list :currency, 25

        get api_v1_currencies_path, headers: auth_header(user)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response_body['currencies'].count).to eq(20)
        expect(response.headers['Page-Items'].to_i).to eq(20)
        expect(response.headers['Total-Pages'].to_i).to eq(2)
      end
    end
  end
end
