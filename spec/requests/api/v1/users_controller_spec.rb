# frozen_string_literal: true

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST /api/v1/users' do
    context 'when params are valid' do
      it 'returns 201 CREATED with jwt token' do
        params = {
          email: 'myemail@email.com',
          nickname: 'random_123',
          password: '123456PW',
          password_confirmation: '123456PW'
        }

        expect do
          post api_v1_users_path, params: { user: params }
        end.to change { User.count }.by(1)

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
          password_confirmation: 'invalid'
        }

        expect do
          post api_v1_users_path, params: { user: params }
        end.to change { User.count }.by(0)

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
          password_confirmation: '123456PW'
        }

        expect do
          post api_v1_users_path, params: { user: params }
        end.to change { User.count }.by(0)

        response_body = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(response_body['token']).not_to be_present
        expect(response_body['errors']).to be_present
      end
    end
  end

  describe 'PATCH /api/v1/users/password' do
    context 'when params are valid' do
      it 'returns 200 OK' do
        user = create :user, password: '123456PW'
        params = {
          current_password: '123456PW',
          new_password: '878787Foo',
          new_password_confirmation: '878787Foo'
        }

        patch password_api_v1_users_path, params: { user: params },
                                          headers: auth_header(user)

        expect(response).to have_http_status(200)
      end
    end

    context 'when current_password is valid' do
      it 'returns 401 UNAUTHORIZED' do
        user = create :user, password: '123456PW'
        params = {
          current_password: 'invalid',
          new_password: '878787Foo',
          new_password_confirmation: '878787Foo'
        }

        patch password_api_v1_users_path, params: { user: params },
                                          headers: auth_header(user)

        expect(response).to have_http_status(401)
      end
    end
  end
end
