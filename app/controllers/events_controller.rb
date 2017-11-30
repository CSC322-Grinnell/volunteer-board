class EventsController < InheritedResources::Base


  #this method allows the current user to sign up for an event. It adds the event id to the users list of events and increments the volunteer_count
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      flash[:notice] = "You are now signed up for this event!"
      #adds the event to the users list of events
      current_user.events << @event
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
      @event.save
    end
    redirect_to events_path
  end

  def create
    if !organization_signed_in?
      return
    end

    # Process the start time and end time
    st = process_start_time
    et = process_end_time
  
    # Gather all the parameters and save them into a new event
    event_info = { :start_time => st, :end_time => et, :name => event_params[:name],
      :description => event_params[:description], :num_vols => event_params[:num_vols], :location => event_params[:location],
      :contact_phone => event_params[:contact_phone], :contact_email => event_params[:contact_email]}
      
    @event = current_organization.events.new(event_info)  

    if @event.save
      redirect_to events_path
    else
      # Changing "Num vols" to "Number of Volunteers" is a bit of a hack,
      #   but I couldn't find a better solution yet
      flash[:error] = @event.errors.full_messages.join("<br/>")
          .gsub("Num vols", "Number of Volunteers")
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if !organization_signed_in?
      return
    end

    # Process the start time and end time
    st = process_start_time
    et = process_end_time
  
    # Gather all the parameters and save them into a new event
    event_info = { :start_time => st, :end_time => et, :name => event_params[:name],
      :description => event_params[:description], :num_vols => event_params[:num_vols], :location => event_params[:location],
      :contact_phone => event_params[:contact_phone], :contact_email => event_params[:contact_email]}
      
    @event = Event.find(params[:id])
    
    if (@event.update(event_info))
      redirect_to @event
    else
      # Changing "Num vols" to "Number of Volunteers" is a bit of a hack,
      #   but I couldn't find a better solution yet
      flash[:error] = @event.errors.full_messages.join("<br/>")
          .gsub("Num vols", "Number of Volunteers")
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def process_start_time
#      gimme_a_syntax_error
      if event_params["start_time(2i)"].length == 1
        start_month = "0" + event_params["start_time(2i)"]
      else
        start_month = event_params["start_time(2i)"]
      end
      
      # -0600 represents the default timezone of CST
      start_time = event_params["start_time(1i)"] + start_month + event_params["start_time(3i)"] + "T" + 
        event_params["start_time(4i)"] + ":" + event_params["start_time(5i)"] + "-0600"
      return DateTime.strptime(start_time, '%Y%m%dT%H:%M%z')
    end
    
    def process_end_time
      if event_params["end_time(2i)"].length == 1
        end_month = "0" + event_params["end_time(2i)"]
      else
        end_month = event_params["end_time(2i)"]
      end
      
      # -0600 represents the default timezone of CST
      end_time = event_params["end_time(1i)"] + end_month + event_params["end_time(3i)"] + "T" +
        event_params["end_time(4i)"] + ":" + event_params["end_time(5i)"] + "-0600"
      return DateTime.strptime(end_time, '%Y%m%dT%H:%M%z')
    end

    def event_params
      params.require(:event).permit(:name, :description, :num_vols, :location,
        :contact_phone, :contact_email, :end_time, :start_time, :start_date, 
        :end_date, :volunteer_count)
    end
end