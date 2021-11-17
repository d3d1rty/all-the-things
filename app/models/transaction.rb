class Transaction < ApplicationRecord
  TAX_RATE = 0.1

  belongs_to :item

  before_create :calculate_profit
  before_update :calculate_profit
  before_create :calculate_tax
  before_update :calculate_tax
  after_save :update_item_values

  validate :date_of_sale_after_stocked_at
  validates :sale_price, presence: true,
                         numericality: {
                           greater_than_or_equal_to: 0,
                           less_than: BigDecimal(10**9)
                         },
                         format: {
                           with: /\A\d{1,5}(\.\d{1,2})?\z/
                         }
  validates :date_of_sale, presence: true

  private

  def calculate_profit
    self.profit = sale_price - item.cost
  end

  def calculate_tax
    self.calculated_tax = sale_price * TAX_RATE
  end

  def update_item_values
    return unless valid?

    item.update(sold_at: date_of_sale, price: sale_price)
  end

  def date_of_sale_after_stocked_at
    if date_of_sale.present? && item.stocked_at.present? && date_of_sale < item.stocked_at
      errors.add(:date_of_sale, 'must be after the stocked date of the associated item')
    end
  end
end
