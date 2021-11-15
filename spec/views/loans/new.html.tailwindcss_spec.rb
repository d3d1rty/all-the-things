require 'rails_helper'

RSpec.describe "loans/new", type: :view do
  before(:each) do
    assign(:loan, Loan.new(
      customer: nil,
      item: nil,
      principal: "9.99",
      interest_rate: "9.99"
    ))
  end

  it "renders new loan form" do
    render

    assert_select "form[action=?][method=?]", loans_path, "post" do

      assert_select "input[name=?]", "loan[customer_id]"

      assert_select "input[name=?]", "loan[item_id]"

      assert_select "input[name=?]", "loan[principal]"

      assert_select "input[name=?]", "loan[interest_rate]"
    end
  end
end
