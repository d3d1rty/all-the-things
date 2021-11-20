class ReportsController < ApplicationController
  def index
  end

  def unsold_items
    @items = Item.where(sold_at: nil).where.not(stocked_at: nil)
  end

  def pawned_items
    @items = Item.joins(:loan).where('stocked_at IS NULL AND released_at IS NOT NULL')
  end
end
