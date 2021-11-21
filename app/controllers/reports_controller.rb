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
end
