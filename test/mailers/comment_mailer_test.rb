require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "comment_added_or_edited" do
    mail = CommentMailer.comment_added_or_edited
    assert_equal "Comment added or edited", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
