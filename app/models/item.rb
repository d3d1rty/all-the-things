class Item < ApplicationRecord
  has_one :loan
  has_one :trans, class_name: 'Transaction'

  validate :stocked_at_not_in_future
  validate :stocked_at_after_default_date
  validates :name, presence: true, length: { maximum: 25 }
  validates :sku, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :price, presence: true,
                    numericality: {
                      greater_than_or_equal_to: 0,
                      less_than: BigDecimal(10**9)
                    },
                    format: {
                      with: /\A\d{1,6}(\.\d{1,2})?\z/
                    }
  validates :cost, presence: true,
                   numericality: {
                     greater_than_or_equal_to: 0,
                     less_than: BigDecimal(10**9)
                   },
                   format: {
                     with: /\A\d{1,6}(\.\d{1,2})?\z/
                   }

  def days_in_stock
    return "" unless stocked_at.present?

    ((sold_at&.to_date || DateTime.current) - stocked_at.to_date).to_i
  end

  private

  def stocked_at_not_in_future
    if stocked_at.present? && stocked_at.future?
      errors.add(:stocked_at, 'cannot be in the future')
    end
  end

  def stocked_at_after_default_date
    return unless stocked_at.present? && loan.present?

    if loan.default_date.present? && stocked_at < loan.default_date
      errors.add(:stocked_at, 'must be after the default date of the associated loan')
    end
  end
end
