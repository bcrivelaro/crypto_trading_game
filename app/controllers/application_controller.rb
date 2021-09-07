# frozen_string_literal: true

class ApplicationController < ActionController::API
  after_action { pagy_headers_merge(@pagy) if @pagy }

  include Pagy::Backend

  private

  def authenticate_user!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    return head :unauthorized if !header

    begin
      @decoded = JwtService.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
