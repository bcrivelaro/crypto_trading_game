RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST /api/v1/users' do
    context 'when params are valid' do
      it 'returns 201 CREATED with jwt token' do
        params = {
          email: 'myemail@email.com',
          nickname: 'random_123',
          password: '123456PW',
          password_confirmation: '123456PW'
        }

        expect {
          post :create, params: { user: params }
        }.to change { User.count }.by(1)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(201)
        expect(response_body['token']).to be_present
      end
    end

    context 'when password_confirmation is invalid' do
      it 'returns 422 UNPROCESSABLE ENTITY' do
        params = {
          email: 'myemail@email.com',
          nickname: 'random_123',
          password: '123456PW',
          password_confirmation: 'invalid',
        }

        expect {
          post :create, params: { user: params }
        }.to change { User.count }.by(0)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(response_body['token']).not_to be_present
        expect(response_body['errors']).to be_present
      end
    end

    context 'when params is invalid' do
      it 'returns 422 UNPROCESSABLE ENTITY' do
        params = {
          email: '',
          nickname: '',
          password: '123456PW',
          password_confirmation: '123456PW',
        }

        expect {
          post :create, params: { user: params }
        }.to change { User.count }.by(0)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(response_body['token']).not_to be_present
        expect(response_body['errors']).to be_present
      end
    end
  end
end
