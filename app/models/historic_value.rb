class HistoricValue < ApplicationRecord
  belongs_to :valueable, polymorphic: true

  validates :usd, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :btc, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :value_at, presence: true

  default_scope -> { order(created_at: :desc) }
end
