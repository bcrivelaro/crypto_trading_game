RSpec.describe WalletEntry, type: :model do
  subject { build :wallet_entry }

  describe 'associations' do
    it { belong_to(:wallet) }
    it { belong_to(:currency) }
  end

  describe 'validations' do
    it { validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
