RSpec.describe Currency, type: :model do
  subject { build :currency }

  describe 'associations' do
    it { should have_many(:historic_values) }
  end

  describe 'validations' do
    it { should validate_presence_of(:symbol) }
    it { should validate_uniqueness_of(:symbol).ignoring_case_sensitivity }
  end
end
