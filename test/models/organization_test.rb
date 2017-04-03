require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  
  def setup
    @organization = Organization.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @organization.valid?
  end
  
  test "name should be present" do
    @organization.name = "     "
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
  
  test "phone should be present" do
    @organization.phone = "     "
    assert_not @organization.valid?
  end
  
  test "emial should be present" do
    @organization.email = "     "
    assert_not @organization.valid?
  end
  
  test "mission should be present" do
    @organization.mission = "     "
    assert_not @organization.valid?
  end
  
  test "website should be present" do
    @organization.website = "     "
    assert_not @organization.valid?
  end
  
  test "password should be present" do
    @organization.password = "     "
    assert_not @organization.valid?
  end
  
  test "confirm should be present" do
    @organization.confirm = "     "
    assert_not @organization.valid?
  end
end
