require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers                    
  include Warden::Test::Helpers                        
  Warden.test_mode!                                    

  def teardown                                         
    Warden.test_reset!                                 
  end
  
  setup do
    org = organizations(:one)
    sign_in org
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end
  
  test "should create event" do
    assert_difference('Event.count', 1) do
      post events_url, params: { event: { contact_email: @event.contact_email, contact_phone: @event.contact_phone, description: @event.description, 
            end_time: @event.end_time, location: @event.location, name: @event.name, num_vols: @event.num_vols, start_time: @event.start_time } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { contact_email: @event.contact_email, contact_phone: @event.contact_phone, description: @event.description, end_time: @event.end_time, location: @event.location, name: @event.name, num_vols: @event.num_vols, start_time: @event.start_time } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
