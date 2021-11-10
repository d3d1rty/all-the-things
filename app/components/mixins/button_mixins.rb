# frozen_string_literal: true

module Mixins
  ##
  # Provides style mixins for buttons.
  module ButtonMixins
    CLASS_LIST = 'appearance-none cursor-pointer inline-block text-lg font-semibold text-center align-middle
                  no-underline select-none transition-colors border-2 border-solid rounded-md px-4 py-3
                  focus:outline-none disabled:cursor-not-allowed disabled:opacity-50'

    def color_classes(color:, variant: nil)
      case variant
      when :outline
        "bg-transparent text-#{color}-500 border-#{color}-500 hover:bg-#{color}-500 hover:text-white"
      else
        "bg-#{color}-500 text-white border-#{color}-500 hover:bg-#{color}-700"
      end
    end
  end
end
