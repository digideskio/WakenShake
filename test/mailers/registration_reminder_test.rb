require 'test_helper'

class RegistrationReminderTest < ActionMailer::TestCase
  test "remind_dancer" do
    mail = RegistrationReminder.remind_dancer
    assert_equal "Remind dancer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
