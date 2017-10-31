class EventsController < InheritedResources::Base
  
  
  #this method allows the current user to sign up for an event. It adds the event id to the users list of events and increments the volunteer_count
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      flash[:notice] = "You are now signed up for this event!"
      #adds the event to the users list of events
      current_user.events << @event
      #if the volunteer_count for the event has not been initialized, initializes it with the value 0
      @event.volunteer_count ||= 0
      #increments the volunteer_count
      @event.volunteer_count = @event.volunteer_count + 1
      @event.save
    end
    #redirects back to the show page from before
    redirect_to events_path
  end
  
  
  #This method requires a previous check that the current_user is linked to the event whoms id is passed in.
  def deregister
    @event = Event.find(params[:id])
    if user_signed_in?
      flash[:notice] = "You are now deregistered."
      #removes the event from the users list of events
      current_user.events.delete(@event)
      #if the volunteer_count for the event has not been initialized, initializes it with the value 0. This line is hypothetically not neccessary, but is in there for saftey0
      @event.volunteer_count ||= 1
      #deincrements the volunteer_count
      @event.volunteer_count = @event.volunteer_count - 1
      @event.save
    end
    redirect_to events_path
  end

  def create
    start_hour = params[:start_hour].to_i + params[:start_ampm].to_i*12
    
    if event_params["start_date(2i)"].length == 1
      start_month = "0" + event_params["start_date(2i)"]
    else
      start_month = event_params["start_date(2i)"]
    end
    
    start_time = event_params["start_date(1i)"].to_s + start_month.to_s + event_params["start_date(3i)"].to_s + "T" + 
      start_hour.to_s + ":" + params[:start_minute].to_s + "-0500"
    st = DateTime.strptime(start_time, '%Y%m%dT%H:%M%Z')
    
    end_hour = params[:end_hour].to_i + params[:end_ampm].to_i*12
    
    if event_params["end_date(2i)"].length == 1
      end_month = "0" + event_params["end_date(2i)"]
    else
      end_month = event_params["end_date(2i)"]
    end
    
    end_time = event_params["end_date(1i)"].to_s + end_month.to_s + event_params["end_date(3i)"].to_s + "T" +
      end_hour.to_s + ":" + params[:end_minute].to_s + "-0500"
    et = DateTime.strptime(end_time, '%Y%m%dT%H:%M%Z')
    
    event_info = { :start_time => st, :end_time => et, :name => event_params[:name], 
      :description => event_params[:description], :num_vols => event_params[:num_vols], :location => event_params[:location], 
      :contact_phone => event_params[:contact_phone], :contact_email => event_params[:contact_email]}
      
    @event = current_organization.events.new(event_info)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end
  

  private

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, 
      :num_vols, :location, :contact_phone, :contact_email, :hour, :minute, :ampm, :start_date, :end_date, :volunteer_count)
    end
end