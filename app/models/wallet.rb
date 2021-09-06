class Wallet < ApplicationRecord
  belongs_to :cycle
  has_many :historic_values, as: :valueable
end