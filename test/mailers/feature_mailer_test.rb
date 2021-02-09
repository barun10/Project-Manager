require 'test_helper'

class FeatureMailerTest < ActionMailer::TestCase
  test "feature_status_updated" do
    mail = FeatureMailer.feature_status_updated
    assert_equal "Feature status updated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
