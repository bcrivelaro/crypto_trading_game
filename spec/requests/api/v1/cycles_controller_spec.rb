# frozen_string_literal: true

RSpec.describe Api::V1::CyclesController, type: :request do
  describe 'GET /api/v1/cycles/current' do
    context 'when not authenticated' do
      it 'returns 401 UNAUTHORIZED' do
        get current_api_v1_cycles_path

        expect(response).to have_http_status(401)
      end
    end

    context 'when authenticated' do
      it 'returns current cycle' do
        user = create :user
        create :cycle, user: user, current: false
        cycle = create :cycle, user: user, current: true

        get current_api_v1_cycles_path, headers: auth_header(user)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response_body['cycle']['id']).to eq(cycle.id)
      end
    end
  end
end
