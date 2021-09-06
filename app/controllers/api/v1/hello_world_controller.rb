# frozen_string_literal: true

module Api
  module V1
    class HelloWorldController < ApplicationController
      def hello_world
        render json: { hello: :world }
      end
    end
  end
end
