require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      name: "MyString",
      sku: "MyString",
      price: "9.99",
      cost: "9.99",
      pawned: false,
      description: "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[sku]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[cost]"

      assert_select "input[name=?]", "item[pawned]"

      assert_select "textarea[name=?]", "item[description]"
    end
  end
end
