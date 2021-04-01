# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mailtester891@gmail.com'
  layout 'mailer'
end
