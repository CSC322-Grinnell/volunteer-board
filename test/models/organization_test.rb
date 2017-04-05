require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  def setup
    @organization = Organization.new(name: "Example Name", address: "1115 8th Avenue", 
    city: "Grinnell", state: "Iowa", zip: "50112", phone: "1234567890", email: "user@example.com",
    mission: "mission", website: "goodstuff.com")
  end

  test "should be valid" do
    assert @organization.valid?
  end
  
  test "name should be present" do
    @organization.name = "     "
    assert_not @organization.valid?
  end
  
  test "name should not be too long" do
    @organization.name = "a" * 51
    assert_not @organization.valid?
  end
  
  test "address should be present" do
    @organization.address = "     "
    assert_not @organization.valid?
  end
  
  test "city should be present" do
    @organization.city = "     "
    assert_not @organization.valid?
  end
  
  test "state should be present" do
    @organization.state = "     "
    assert_not @organization.valid?
  end
  
  test "zip should be present" do
    @organization.zip = "     "
    assert_not @organization.valid?
  end
  
  test "zip should not be too long" do
    @organization.zip = "a" * 6
    assert_not @organization.valid?
  end
  
  test "phone should be present" do
    @organization.phone = "     "
    assert_not @organization.valid?
  end
  
  test "email should be present" do
    @organization.email = "     "
    assert_not @organization.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @organization.email = mixed_case_email
    @organization.save
    assert_equal mixed_case_email.downcase, @organization.reload.email
  end
  
  test "mission should be present" do
    @organization.mission = "     "
    assert_not @organization.valid?
  end
  
  test "website should be present" do
    @organization.website = "     "
    assert_not @organization.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_organization = @organization.dup
    duplicate_organization.email = @organization.email.upcase
    @organization.save
    assert_not duplicate_organization.valid?
  end
end
