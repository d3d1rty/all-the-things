FactoryBot.define do
  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    address_line_one { "MyString" }
    address_line_two { "MyString" }
    state { "MyString" }
    city { "MyString" }
    zip { "MyString" }
    phone_number { "MyString" }
  end
end
