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
      link_to(format_date(item.sold_at), transaction_path(item.trans), class: 'text-blue-500 hover:text-blue-700 underline', data: { turbo: false })
    elsif item.stocked_at.present? && item.trans.blank?
      link_to('Record Transaction', new_transaction_path(sale_price: item.price), class: 'text-blue-500 hover:text-blue-700 underline', data: { turbo: false })
    end
  end
end
