class User < ApplicationRecord
  has_secure_password

  has_many :cycles

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :member, inclusion: { in: [true, false] }

  def current_cycle
    cycles.current.first
  end
end