class EventsController < InheritedResources::Base
  
  
  #this method allows the current user to sign up for an event. It adds the event id to the users list of events and increments the volunteer_count
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      #adds the event to the users list of events
      current_user.events << @event
      #if the volunteer_count for the event has not been initialized, initializes it with the value 0
      @event.volunteer_count ||= 0
      #increments the volunteer_count
      @event.volunteer_count = @event.volunteer_count + 1
      @event.save
    end
    #redirects back to the show page from before
    redirect_to action: "show", id: @event.id
  end
  
  
  #This method requires a previous check that the current_user is linked to the event whoms id is passed in.
  def deregister
    @event = Event.find(params[:id])
    if user_signed_in?
      #removes the event from the users list of events
      current_user.events.delete(@event)
      #if the volunteer_count for the event has not been initialized, initializes it with the value 0. This line is hypothetically not neccessary, but is in there for saftey0
      @event.volunteer_count ||= 0
      #deincrements the volunteer_count
      @event.volunteer_count = @event.volunteer_count - 1
      @event.save
    end
    redirect_to action: "show", id: @event.id
  end

  def create
    @event = current_organization.events.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  

  private

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :num_vols, :location, :contact_phone, :contact_email, :volunteer_count)
    end
    
    #def show
    #   puts "*** Showing"
    # end
    

end

