require 'rails_helper'

RSpec.describe "loans/index", type: :view do
  before(:each) do
    assign(:loans, [
      Loan.create!(
        customer: nil,
        item: nil,
        principal: "9.99",
        interest_rate: "9.99"
      ),
      Loan.create!(
        customer: nil,
        item: nil,
        principal: "9.99",
        interest_rate: "9.99"
      )
    ])
  end

  it "renders a list of loans" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
