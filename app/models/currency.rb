class Currency < ApplicationRecord
  validates :symbol, presence: true, uniqueness: { case_sensitive: false }
end
