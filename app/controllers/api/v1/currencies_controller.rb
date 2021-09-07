# frozen_string_literal: true

module Api
  module V1
    class CurrenciesController < ApplicationController
      before_action :authenticate_user!

      def index
        @pagy, @currencies = pagy(Currency.all)

        render json: { currencies: @currencies }, status: :ok
      end
    end
  end
end
