require 'rails_helper'

RSpec.describe "loans/edit", type: :view do
  before(:each) do
    @loan = assign(:loan, Loan.create!(
      customer: nil,
      item: nil,
      principal: "9.99",
      interest_rate: "9.99"
    ))
  end

  it "renders the edit loan form" do
    render

    assert_select "form[action=?][method=?]", loan_path(@loan), "post" do

      assert_select "input[name=?]", "loan[customer_id]"

      assert_select "input[name=?]", "loan[item_id]"

      assert_select "input[name=?]", "loan[principal]"

      assert_select "input[name=?]", "loan[interest_rate]"
    end
  end
end
