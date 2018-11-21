require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "First", last_name: "Last", address: "123 Main St.", city: "Grinnell", state: "Iowa", zip_code: 12345, 
    phone_number: "1234567890", email: "testemail@example.com", password: "12345678910")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end
  
  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end
  
  test "address should be present" do
    @user.address = ""
    assert_not @user.valid?
  end
  
  test "city should be present" do
    @user.city = ""
    assert_not @user.valid?
  end
  
  test "state should be present" do
    @user.state = ""
    assert_not @user.valid?
  end
  
  test "zip_code should be present" do
    @user.zip_code = ""
    assert_not @user.valid?
  end
  
  test "phone_number can be absent" do
    @user.phone_number = ""
    assert @user.valid?
  end
  
  test "first_name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end
  
  test "phone_number should not be more than 10 digits" do
    @user.phone_number = "12345678901"
    assert_not @user.valid?
  end
  
  test "phone_number should not be fewer than 10 digits" do
    @user.phone_number = "123456789"
    assert_not @user.valid?
  end
end
