RSpec.describe Currency, type: :model do
  subject { build :currency }

  describe 'validations' do
    it { should validate_presence_of(:symbol) }
    it { should validate_uniqueness_of(:symbol).ignoring_case_sensitivity }
  end
end
