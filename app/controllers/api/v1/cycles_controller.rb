# frozen_string_literal: true

module Api
  module V1
    class CyclesController < ApplicationController
      before_action :authenticate_user!

      def current
        @cycle = current_user.current_cycle

        render json: { cycle: @cycle }, status: :ok
      end
    end
  end
end
