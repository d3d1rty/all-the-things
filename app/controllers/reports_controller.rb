class ReportsController < ApplicationController
  def index
  end

  def unsold_items
    @items = Item.where(sold_at: nil).where.not(stocked_at: nil)
  end

  def pawned_items
    @items = Item.joins(:loan).where('stocked_at IS NULL AND released_at IS NOT NULL')
  end

  def profit_per_tx
    @transactions = Transaction.all.order(date_of_sale: :desc)
  end

  def profit_per_day_of_shelf_life
    @transactions = Transaction.all.order(date_of_sale: :desc)
  end

  def time_from_default_to_release
    @items = Item.joins(:loan).where.not(loan: { default_date: nil }, released_at: nil)
  end

  def monthly_revenue_per_item
    @transactions = Transaction.joins(:item)
                               .group('items.name')
                               .where('date_of_sale >= ? and date_of_sale < ?', Date.today.at_beginning_of_month, Date.today.at_end_of_month)
                               .pluck("items.name as product_name, sum(transactions.sale_price) as revenue, sum(transactions.profit) as profit")
  end
end
