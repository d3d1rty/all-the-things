# frozen_string_literal: true

##
# Component that wraps buttons generated using button_to.
class ButtonToComponent < ViewComponent::Base
  include Mixins::UtilityMixins
  include Mixins::ButtonMixins

  attr_reader :link, :method, :color, :data_attrs, :classes

  def initialize(color:, link:, method:, data_attrs: nil, options: {})
    super
    @link = link
    @method = method
    @data_attrs = data_attrs
    @classes = merge_classes([
                               CLASS_LIST,
                               color_classes(color: color, variant: options[:variant]),
                               options[:classes]
                             ])
  end

  def call
    button_to(link, method: method, class: classes, data: data_attrs) do
      content
    end
  end
end
