# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, except: :create

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

      def password
        if @current_user&.authenticate(update_pw_params[:current_password])
          if @current_user.update(password: update_pw_params[:new_password],
                          password_confirmation: update_pw_params[:new_password_confirmation])

            head :ok
          else
            render json: { errors: @current_user.errors },
                   status: :unprocessable_entity
          end
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :nickname, :password,
                                     :password_confirmation)
      end

      def update_pw_params
        params.require(:user).permit(:current_password, :new_password,
                                     :new_password_confirmation)
      end
    end
  end
end
