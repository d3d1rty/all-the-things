require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      first_name: "First Name",
      last_name: "Last Name",
      address_line_one: "Address Line One",
      address_line_two: "Address Line Two",
      state: "State",
      city: "City",
      zip: "Zip",
      phone_number: "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Address Line One/)
    expect(rendered).to match(/Address Line Two/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Phone Number/)
  end
end
