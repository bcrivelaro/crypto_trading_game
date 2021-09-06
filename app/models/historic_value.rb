class HistoricValue < ApplicationRecord
  belongs_to :valueable, polymorphic: true

  validates :usd, presence: true, numericality: { only_integer: true }
  validates :btc, presence: true, numericality: { only_integer: true }
  validates :value_at, presence: true
end
