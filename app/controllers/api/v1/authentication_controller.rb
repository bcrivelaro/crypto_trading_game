# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      def login
        @user = User.find_by(email: login_params[:email])

        if @user&.authenticate(login_params[:password])
          exp = 24.hours.from_now.to_i
          token = JwtService.encode({ user_id: @user.id }, exp)

          render json: { token: token, exp: exp }, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      private

      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
