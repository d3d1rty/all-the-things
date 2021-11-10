# frozen_string_literal: true

##
# Base class for mailers
class ApplicationMailer < ActionMailer::Base
  default from: "dick@hey.com"
  layout 'mailer'
end
