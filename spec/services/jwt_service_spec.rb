RSpec.describe JwtService do
  describe '.encode' do
    it 'returns encoded payload' do
      payload = { foo: 'bar' }.with_indifferent_access

      response = JwtService.encode(payload)

      expect(response).not_to eq(payload)
    end
  end

  describe '.decode' do
    it 'returns decoded payload' do
      payload = { foo: 'bar' }.with_indifferent_access
      encoded = JwtService.encode(payload)

      decoded = JwtService.decode(encoded)

      expect(decoded).to eq(payload)
    end
  end
end
