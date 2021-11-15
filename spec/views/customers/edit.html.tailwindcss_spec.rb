require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      first_name: "MyString",
      last_name: "MyString",
      address_line_one: "MyString",
      address_line_two: "MyString",
      state: "MyString",
      city: "MyString",
      zip: "MyString",
      phone_number: "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[last_name]"

      assert_select "input[name=?]", "customer[address_line_one]"

      assert_select "input[name=?]", "customer[address_line_two]"

      assert_select "input[name=?]", "customer[state]"

      assert_select "input[name=?]", "customer[city]"

      assert_select "input[name=?]", "customer[zip]"

      assert_select "input[name=?]", "customer[phone_number]"
    end
  end
end
