class Currency < ApplicationRecord
  has_many :historic_values, as: :valueable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :symbol, presence: true, uniqueness: { case_sensitive: false }
end
