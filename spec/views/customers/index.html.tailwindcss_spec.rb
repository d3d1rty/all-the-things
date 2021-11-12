require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address_line_one: "Address Line One",
        address_line_two: "Address Line Two",
        state: "State",
        city: "City",
        zip: "Zip",
        phone_number: "Phone Number"
      ),
      Customer.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address_line_one: "Address Line One",
        address_line_two: "Address Line Two",
        state: "State",
        city: "City",
        zip: "Zip",
        phone_number: "Phone Number"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Address Line One".to_s, count: 2
    assert_select "tr>td", text: "Address Line Two".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Zip".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
  end
end
