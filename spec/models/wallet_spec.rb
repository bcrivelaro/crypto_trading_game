RSpec.describe Wallet, type: :model do
  subject { build :wallet }

  describe 'associations' do
    it { should belong_to(:cycle) }
  end
end
