# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    name { 'United States Dollar' }
    symbol { 'USD' }
  end
end
