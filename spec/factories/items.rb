FactoryBot.define do
  factory :item do
    name { "MyString" }
    sku { "MyString" }
    price { "9.99" }
    cost { "9.99" }
    pawned { false }
    released_at { "2021-11-10 21:00:46" }
    stocked_at { "2021-11-10 21:00:46" }
    sold_at { "2021-11-10 21:00:46" }
    description { "MyText" }
  end
end
