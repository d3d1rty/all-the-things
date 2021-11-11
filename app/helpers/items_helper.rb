module ItemsHelper
  def status_for_release(item)
    if item.pawned? && item.released_at.present?
      'Yes'
    elsif item.pawned?
      'No'
    else
      'N/A'
    end
  end
end
