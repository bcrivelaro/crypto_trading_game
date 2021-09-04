class Api::V1::HelloWorldController < ApplicationController
  def hello_world
    render json: { hello: :world }
  end
end
