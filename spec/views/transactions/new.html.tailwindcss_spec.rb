require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      item: nil,
      sale_price: "9.99",
      profit: "9.99",
      calculated_tax: "9.99"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[item_id]"

      assert_select "input[name=?]", "transaction[sale_price]"

      assert_select "input[name=?]", "transaction[profit]"

      assert_select "input[name=?]", "transaction[calculated_tax]"
    end
  end
end
