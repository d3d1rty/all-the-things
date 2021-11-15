class Loan < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :principal, presence: true,
                        numericality: {
                          greater_than_or_equal_to: 0,
                          less_than: BigDecimal(10**9)
                        },
                        format: {
                          with: /\A\d{1,5}(\.\d{1,2})?\z/
                        }

  validates :interest_rate, presence: true,
                            numericality: {
                              greater_than_or_equal_to: 0,
                              less_than: BigDecimal(10**7)
                            },
                            format: {
                              with: /\A\d{1,3}(\.\d{1,2})?\z/
                            }
  validates :maturity_date, presence: true
end
