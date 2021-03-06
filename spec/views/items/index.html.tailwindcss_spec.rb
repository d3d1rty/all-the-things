require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        name: "Name",
        sku: "Sku",
        price: "9.99",
        cost: "9.99",
        pawned: false,
        description: "MyText"
      ),
      Item.create!(
        name: "Name",
        sku: "Sku",
        price: "9.99",
        cost: "9.99",
        pawned: false,
        description: "MyText"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Sku".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
