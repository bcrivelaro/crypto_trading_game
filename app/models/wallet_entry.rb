# frozen_string_literal: true

class WalletEntry < ApplicationRecord
  belongs_to :wallet
  belongs_to :currency

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
