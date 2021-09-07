# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    sequence(:name) { |n| "Currency #{n}" }
    sequence(:symbol) { |n| "CUR#{n}" }
  end
end
