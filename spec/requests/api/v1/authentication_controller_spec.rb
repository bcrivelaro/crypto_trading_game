RSpec.describe Api::V1::AuthenticationController, type: :request do
  describe 'POST /api/v1/auth/login' do
    context 'when credentials are correct' do
      it 'returns 200 OK with jwt token' do
        user = create :user, password: '12345678'

        post api_v1_auth_login_path, params: { email: user.email,
                                               password: '12345678' }

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response_body['token']).to be_present
      end
    end

    context 'when credentials are incorrect' do
      it 'returns 401 UNAUTHORIZED' do
        user = create :user, password: '12345678'

        post api_v1_auth_login_path, params: { email: user.email,
                                               password: 'invalid' }

        expect(response).to have_http_status(401)
      end
    end
  end
end
