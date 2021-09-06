# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user.valid?
          @user.save!
          exp = 24.hours.from_now.to_i
          token = JwtService.encode({ user_id: @user.id }, exp)

          render json: { token: token, exp: exp }, status: :created
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :nickname, :password,
                                     :password_confirmation)
      end
    end
  end
end
