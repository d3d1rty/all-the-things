# frozen_string_literal: true

##
# Base class for mailers
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV['APP_DOMAIN']}"
  layout 'mailer'
end
