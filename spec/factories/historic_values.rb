FactoryBot.define do
  factory :historic_value do
    for_currency # default trait

    usd { "9.99" }
    btc { "0.000001" }
    value_at { "2021-09-06 00:35:13" }

    trait :for_currency do
      association :valueable, factory: :currency
    end

    trait :for_wallet do
      association :valueable, factory: :wallet
    end
  end
end
