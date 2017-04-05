require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example Name", address: "1115 8th Avenue", 
    city: "Grinnell", state: "Iowa", zip: "50112", phone: "1234567890", email: "user@example.com",
    mission: "mission", website: "goodstuff.com", password: "***", password_confirmation: "***")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
