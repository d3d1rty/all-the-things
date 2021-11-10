# frozen_string_literal: true

##
# Component that wraps buttons generated using button_tag.
class ButtonTagComponent < ViewComponent::Base
  include Mixins::UtilityMixins
  include Mixins::ButtonMixins

  attr_reader :classes, :type, :data_attrs

  def initialize(type:, color:, options: {})
    super
    @type = type
    @data_attrs = options[:data] || {}
    @classes = merge_classes([
                               CLASS_LIST,
                               color_classes(color: color, variant: options[:variant]),
                               options[:classes]
                             ])
  end

  def call
    button_tag(type: type, class: classes, data: data_attrs) do
      content
    end
  end
end
