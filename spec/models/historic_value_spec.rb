RSpec.describe HistoricValue, type: :model do
  subject { build :historic_value }

  describe 'associations' do
    it { should belong_to(:valueable) }
  end

  describe 'validations' do
    it { should validate_presence_of(:usd) }
    it { should validate_numericality_of(:usd).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:btc) }
    it { should validate_numericality_of(:btc).is_greater_than_or_equal_to(0) }
    it { should validate_presence_of(:value_at) }
  end
end
