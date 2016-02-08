require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "mass_dancer" do
    mail = AdminMailer.mass_dancer
    assert_equal "Mass dancer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mass_donor" do
    mail = AdminMailer.mass_donor
    assert_equal "Mass donor", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
