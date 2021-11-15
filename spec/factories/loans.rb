FactoryBot.define do
  factory :loan do
    customer { nil }
    item { nil }
    principal { "9.99" }
    interest_rate { "9.99" }
    maturity_date { "2021-11-15 20:46:33" }
    default_date { "2021-11-15 20:46:33" }
  end
end
