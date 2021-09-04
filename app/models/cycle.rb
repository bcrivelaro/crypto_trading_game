class Cycle < ApplicationRecord
  belongs_to :user

  enum mode: { easy: 'easy', hard: 'hard' }

  validates :current, inclusion: { in: [true, false] }
  validate :unique_current_cycle
  validates :points, numericality: { only_integer: true }, if: -> { points.present? }
  validates :order, numericality: { only_integer: true },
            uniqueness: { scope: :user_id }

  scope :current, -> { where(current: true) }

  private

  def unique_current_cycle
    return unless user.present?
    user.reload if user.persisted?

    if self.current && user.current_cycle.present? && user.current_cycle.id != self.id
      errors.add(:current, message: 'already exists current cycle')
    end
  end
end