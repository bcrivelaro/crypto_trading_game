# frozen_string_literal: true

module Api
  module V1
    class WalletsController < ApplicationController
      before_action :authenticate_user!

      def current
        @wallet_entries = current_user.current_wallet.wallet_entries

        render json: { wallet_entries: @wallet_entries }, status: :ok
      end
    end
  end
end
