# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cycles

  validates :nickname, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :member, inclusion: { in: [true, false] }

  def current_cycle
    cycles.find_by(current: true)
  end

  def current_wallet
    current_cycle.wallet
  end

  def points
    cycles.where.not(points: nil).sum(:points)
  end
end
