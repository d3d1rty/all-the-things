# frozen_string_literal: true

##
# Base class for controllers
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
     items_path
  end
end
