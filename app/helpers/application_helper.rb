# frozen_string_literal: true

##
# Base helpers for views
module ApplicationHelper
  KEEP_THESE_CLASSES = 'bg-red-500 border-red-500 text-red-500 bg-red-500 hover:bg-red-500 hover:bg-red-700 bg-red-500 border-blue-500 text-blue-500 bg-blue-500 hover:bg-blue-500 hover:bg-blue-700'

  def th_for_header(text)
    tag.th(text, class: 'px-4 py-3')
  end

  def th_for_body(text, classes: nil)
    tag.th(text, class: "border px-4 py-2#{' ' + classes if classes.present?}")
  end

  def format_date(date)
    date.strftime('%m/%d/%Y')
  end
end
