# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/comment_added_or_edited
  def comment_added_or_edited
    CommentMailer.comment_added_or_edited
  end

end
