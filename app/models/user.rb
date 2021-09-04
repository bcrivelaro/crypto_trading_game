class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :member, presence: true, inclusion: { in: [true, false] }
end
