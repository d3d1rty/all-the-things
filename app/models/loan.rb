class Loan < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  after_update :release_item, if: :saved_change_to_default_date?

  validate :default_date_not_in_future
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

  private

  def release_item
    item.released_at = Time.now
    item.save
  end

  def default_date_not_in_future
    if default_date.present? && default_date.future?
      errors.add(:default_date, 'cannot be in the future')
    end
  end
end
