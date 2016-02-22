require 'test_helper'

class NewsletterTest < ActionMailer::TestCase
  test "weekly-mailer" do
    mail = Newsletter.weekly-mailer
    assert_equal "Weekly-mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
