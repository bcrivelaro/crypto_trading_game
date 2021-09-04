RSpec.describe User, type: :model do
  subject { build :user }

  describe 'associations' do
    it { should have_many(:cycles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname).ignoring_case_sensitivity }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should have_secure_password }
  end

  describe '#current_cycle' do
    it 'returns current_cycle' do
      user = create :user
      create :cycle, user: user, current: false
      create :cycle, user: user, current: false
      current = create :cycle, user: user, current: true

      expect(user.current_cycle).to eq(current)
    end
  end

  describe '#points' do
    it 'return sum of cycles points' do
      user = create :user
      create :cycle, user: user, current: false, points: 1
      create :cycle, user: user, current: false, points: 2
      create :cycle, user: user, current: true, points: nil

      expect(user.points).to eq(3)
    end
  end
end
