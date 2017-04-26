require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @org = Organization.new(name: "Org 1", email: "org1@orgsite.com", 
    address: "123 Main St.", city: "Grinnell", state: "IA", zip: "50112",
    phone: "0123456789", mission: "To promote community in Grinnell.", 
    website: "http://www.example.com", password: "1234567")
  end
  
  test "should be valid" do
    assert @org.valid?
  end
  
  test "name should be present" do
    @org.name = ""
    assert_not @org.valid?
  end
  
  test "name should be less than 60 characters" do
    @org.name = "a" * 61
    assert_not @org.valid?
  end
  
  test "email should be present" do
    @org.email = ""
    assert_not @org.valid?
  end 
  
  test "email should be valid" do
    @org.email = "tester.com"
    assert_not @org.valid?
  end
  
  test "address should be present" do
    @org.address = ""
    assert_not @org.valid?
  end
  
  test "city should be present" do
    @org.city = ""
    assert_not @org.valid?
  end
  
  test "state should be present" do
    @org.state = ""
    assert_not @org.valid?
  end
  
  test "zip should be present" do
    @org.zip = ""
    assert_not @org.valid?
  end
  
  test "phone should be present" do
    @org.phone = ""
    assert_not @org.valid?
  end
  
  test "phone should have length 10" do
    @org.phone = "1234567"
    assert_not @org.valid?
    
    @org.phone = "12345678901"
    assert_not @org.valid?
  end
  
  
  test "mission should have max length 250" do
    @org.mission = ""
    assert @org.valid?
    
    @org.mission = "a" * 251
    assert_not @org.valid?
  end
  
  test "website should be valid" do
    @org.website = "https://www.website.com" # tests https. http tested originally
    assert @org.valid?
    
    @org.website = "www.website.com" # test that http precedes the url
    assert_not @org.valid?
    
    @org.website = "http://website.com" # test that www. is not necessary
    assert @org.valid?
  end
  
end
