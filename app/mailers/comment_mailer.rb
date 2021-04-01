# frozen_string_literal: true

# Service to download ftp files from the server
class CommentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.comment_added_or_edited.subject
  #
  def comment_added_or_edited
    @user = params[:user]
    @feature = params[:feature]
    @comment = params[:comment]
    mail to: @user.email, subject: 'Comment added/edited'
  end
end
