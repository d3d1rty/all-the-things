require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      item: nil,
      sale_price: "9.99",
      profit: "9.99",
      calculated_tax: "9.99"
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[item_id]"

      assert_select "input[name=?]", "transaction[sale_price]"

      assert_select "input[name=?]", "transaction[profit]"

      assert_select "input[name=?]", "transaction[calculated_tax]"
    end
  end
end
