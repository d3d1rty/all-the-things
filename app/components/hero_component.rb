# frozen_string_literal: true

##
# Component for "hero" layout slices.
class HeroComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  CLASS_LIST = 'flex flex-row flex-wrap justify-center text-black dark:text-white p-10 md:p-6'

  renders_one :headline, lambda { |text, options: {}|
    tag.h1(text, class: merge_classes(['flex-100 text-center break-words text-6xl', options[:classes]]))
  }

  renders_one :lede, lambda { |text, options: {}|
    tag.p(text, class: merge_classes(['flex-100 text-center break-words text-2xl', options[:classes]]))
  }

  def initialize(options: {})
    super
    @classes = merge_classes([CLASS_LIST, options[:classes]])
  end
end
