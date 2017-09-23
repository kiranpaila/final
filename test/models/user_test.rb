require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
    @user = User.new(name: "Example User", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.password = "     "
    assert_not @user.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
