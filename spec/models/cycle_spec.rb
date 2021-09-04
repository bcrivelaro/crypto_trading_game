RSpec.describe Cycle, type: :model do
  subject { build :cycle }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:wallet) }
  end

  describe 'validations' do
    it do
      should define_enum_for(:mode).
        with_values(easy: 'easy', hard: 'hard').
        backed_by_column_of_type(:string)
    end
    it { should validate_numericality_of(:points).only_integer }
    it { should validate_numericality_of(:order).only_integer }
    it { should validate_uniqueness_of(:order).scoped_to(:user_id) }

    it 'validates unique current cycle' do
      user = create :user
      create :cycle, user: user, current: true
      cycle = build :cycle, user: user, current: true

      cycle.valid?

      expect(cycle.errors[:current]).to eq(['already exists current cycle'])
    end
  end

  describe '.current' do
    it 'returns current cycles only' do
      create_list :cycle, 3, current: false
      current_cycles = create_list :cycle, 3, current: true

      list = Cycle.current

      expect(list).to match_array(current_cycles)
    end
  end
end
