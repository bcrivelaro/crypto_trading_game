RSpec.describe User, type: :model do
  subject { build :user }

  it { should validate_presence_of(:nickname) }
  it { should validate_uniqueness_of(:nickname).ignoring_case_sensitivity }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should have_secure_password }
end
