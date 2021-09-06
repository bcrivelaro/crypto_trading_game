# frozen_string_literal: true

FactoryBot.define do
  factory :wallet_entry do
    wallet
    currency
    amount { 100_000 }
  end
end
