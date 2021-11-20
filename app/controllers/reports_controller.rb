class ReportsController < ApplicationController
  def index
  end

  def unsold_items
    @items = Item.where(sold_at: nil).where.not(stocked_at: nil)
  end
end
