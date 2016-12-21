require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "no se requiere email para crear un usuario" do
    assert_not User.new.email_required?
    assert_not User.new.email_changed?
  end
end
