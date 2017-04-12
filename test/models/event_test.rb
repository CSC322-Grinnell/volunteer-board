require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(name: "Event 1", description: "Example event", 
    start_time: Time.new,
    end_time: Time.new, num_vols: 10, location: "Grinnell College", contact_phone: "1234567890", contact_email: "contact@example.com")
  end
  
  test "should be valid" do
    assert @event.valid?
  end
  
  test "name should be present" do
    @event.name = ""
    assert_not @event.valid?
  end
  
  test "description should be present" do
    @event.description = ""
    assert_not @event.valid?
  end
  
  test "start_time should be present" do
    @event.start_time = ""
    assert_not @event.valid?
  end
  
  test "end_time should be present" do
    @event.end_time = ""
    assert_not @event.valid?
  end
  
  test "num_vols should be present" do
    @event.num_vols = ""
    assert_not @event.valid?
  end
  
  test "location should be present" do
    @event.location = ""
    assert_not @event.valid?
  end
  
  test "contact_phone should be present" do
    @event.contact_phone = ""
    assert_not @event.valid?
  end
  
  test "contact_email should be present" do
    @event.contact_email = ""
    assert_not @event.valid?
  end

  test "name should not be too long" do
    @event.name = "a" * 51
    assert_not @event.valid?
  end
  
  test "contact_phone should not be more than 10 digits" do
    @event.contact_phone = "12345678901"
    assert_not @event.valid?
  end
  
  test "contact_phone should not be fewer than 10 digits" do
    @event.contact_phone = "123456789"
    assert_not @event.valid?
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @event.contact_email = invalid_address
      assert_not @event.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
