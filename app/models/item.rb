class Item < ApplicationRecord
  has_one :loan

  validates :name, presence: true, length: { maximum: 25 }
  validates :sku, presence: true, length: { maximum: 20 }
  validates :price, presence: true,
                    numericality: {
                      greater_than_or_equal_to: 0,
                      less_than: BigDecimal(10**7)
                    },
                    format: {
                      with: /\A\d{1,3}(\.\d{1,2})?\z/
                    }
  validates :cost, presence: true,
                   numericality: {
                     greater_than_or_equal_to: 0,
                     less_than: BigDecimal(10**7)
                   },
                   format: {
                     with: /\A\d{1,3}(\.\d{1,2})?\z/
                   }

  def days_in_stock
    ((sold_at&.to_date || DateTime.current) - stocked_at.to_date).to_i
  end
end
