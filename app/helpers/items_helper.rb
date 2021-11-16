module ItemsHelper
  def status_for_release(item)
    if item.loan.present? && item.released_at.present?
      'Yes'
    elsif item.loan.present?
      'No'
    end
  end

  def value_for_sold_date(item)
    return "" if status_for_release(item)&.casecmp?('No')

    if item.sold_at.present?
      format_date(item.sold_at)
    elsif item.stocked_at.present?
      link_to('Record Transaction', '#', class: 'text-blue-500 hover:text-blue-700 underline', data: { turbo: false })
    end
  end
end
