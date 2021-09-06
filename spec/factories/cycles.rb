# frozen_string_literal: true

FactoryBot.define do
  factory :cycle do
    user
    mode { :easy }
    current { true }
    points { nil }
    sequence(:order)
  end
end
