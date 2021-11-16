class Item < ApplicationRecord
  has_one :loan

  validate :stocked_at_not_in_future
  validates :name, presence: true, length: { maximum: 25 }
  validates :sku, presence: true, length: { maximum: 20 }
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
end
