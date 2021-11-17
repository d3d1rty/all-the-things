FactoryBot.define do
  factory :transaction do
    item { nil }
    sale_price { "9.99" }
    profit { "9.99" }
    calculated_tax { "9.99" }
    date_of_sale { "2021-11-16 18:07:54" }
  end
end
