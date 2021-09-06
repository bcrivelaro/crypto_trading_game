class Currency < ApplicationRecord
  has_many :historic_values, as: :valueable

  validates :symbol, presence: true, uniqueness: { case_sensitive: false }
end
