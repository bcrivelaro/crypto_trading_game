RSpec.describe Wallet, type: :model do
  subject { build :wallet }

  describe 'associations' do
    it { should belong_to(:cycle) }
    it { should have_many(:historic_values) }
  end
end
