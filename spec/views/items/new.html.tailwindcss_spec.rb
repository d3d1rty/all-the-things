require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      sku: "MyString",
      price: "9.99",
      cost: "9.99",
      pawned: false,
      description: "MyText"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[sku]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[cost]"

      assert_select "input[name=?]", "item[pawned]"

      assert_select "textarea[name=?]", "item[description]"
    end
  end
end
