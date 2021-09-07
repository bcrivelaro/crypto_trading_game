module AuthHelpers
  def auth_header(user)
    token = JwtService.encode(user_id: user.id)

    { Authorization: "Bearer #{token}" }
  end
end
