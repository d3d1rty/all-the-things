# frozen_string_literal: true

##
# Provides component for grouped form labels and fields as well as error validations.
class FormGroupComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  INPUT_CLASS_LIST = 'block w-full appearance-none leading-loose transition-colors
                      placeholder-gray-400 hover:border-gray-400 focus:border-blue-500 rounded my-2'

  renders_one :label, lambda { |text, options: {}|
    @form.label(
      @field,
      text,
      for: @field,
      class: merge_classes(['text-gray-900 dark:text-white font-semibold', options[:classes]])
    )
  }

  renders_one :select, lambda { |choices, options: {}, html_options: {}|
    @form.select(
      @field,
      choices,
      options,
      html_options.merge(class: merge_classes([INPUT_CLASS_LIST, html_options[:classes]]))
    )
  }

  renders_one :text, lambda { |html_options: {}|
    @form.text_field(
      @field,
      html_options.merge(class: merge_classes([INPUT_CLASS_LIST, html_options[:classes]]))
    )
  }

  def initialize(form:, field:, errors:)
    super
    @form = form
    @field = field
    @errors = errors
  end
end
