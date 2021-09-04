FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "nickname#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password { 'pwd_123' }
    member { false }
  end
end
