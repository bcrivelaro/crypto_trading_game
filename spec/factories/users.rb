FactoryBot.define do
  factory :user do
    nickname { 'nickname' }
    email { 'johndoe@email.com' }
    password_digest { 'pwd_123' }
    member { false }
  end
end
