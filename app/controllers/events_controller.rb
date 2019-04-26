class EventsController < InheritedResources::Base


  #this method allows the current user to sign up for an event. It adds the event id to the users list of events and increments the volunteer_count
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      flash[:notice] = "You are now signed up for this event!"
      #adds the event to the users list of events
      current_user.events << @event
      @event.save
      #puts "The current user email  :::" + current_user.email --> for testing purpose.
      #After event is successfully added and stored, call mailer to send confirmation email.
      UserMailer.signup_email(current_user).deliver_now
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
    if not (user_signed_in? and current_user.organization)
      return
    end

    # Process the start time and end time
    st = process_start_time
    et = process_end_time

    # Gather all the parameters and save them into a new event
    event_info = { :start_time => st, :end_time => et, :name => event_params[:name],
      :description => event_params[:description], :num_vols => event_params[:num_vols], :location => event_params[:location],
      :contact_phone => event_params[:contact_phone], :contact_email => event_params[:contact_email]}

    @event = Event.new(event_info)
    
    # Build skills array from params
    skill_arr = event_params[:skills].split(', ')
    skill_arr.each do |skill_name|
      skill = Skill.create(:name => skill_name)
      @event.skills << skill
    end
    
    current_user.events << @event

    if @event.save
      flash[:notice] = "You successfully created an event!"
      redirect_to events_path
    else
      # Changing "Num vols" to "Number of Volunteers" is a bit of a hack,
      #   but I couldn't find a better solution yet
      # flash[:error] ||= @event.errors.full_messages.join("<br/>")
      #     .gsub("Num vols", "Number of Volunteers")
      # redirect_back(fallback_location: root_path)
      # rerender the page with all entered fields saved.
      render "events/new"
    end
  end

  def update
    if not (user_signed_in? and current_user.organization)
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
      flash[:notice] = "You successfully updated your event!"
      redirect_to @event
    else
      render "events/new"
    end
  end
  
  def email_volunteers
    id = params[:id]
    @users = Event.find_by_id(id).users
    # 1. We can send bulk emails to all recipients, who can see every other participant's email.
    # UserMailer.group_mail(@users, params[:subject], params[:content]).deliver_now
    # 2. OR we can send customized/individual emails to each parcitipant.
    @users.each do |user|
      UserMailer.volunteer_mail(user, params[:subject], params[:content]).deliver_now
    end
    puts 'This is me sending some swag emails...........'
    # Need to return json based on email success/failure --> then ajax handling from frontend.
    respond_to do |format|
      format.js
    end
  end

  private

    #Returns nil if the time was invalid
    def process_start_time
      #gimme_a_syntax_error
      if event_params["start_time(2i)"].length == 1
        start_month = "0" + event_params["start_time(2i)"]
      else
        start_month = event_params["start_time(2i)"]
      end

      # -0600 represents the default timezone of CST
      start_time = event_params["start_time(1i)"] + start_month + event_params["start_time(3i)"] + "T" +
        event_params["start_time(4i)"] + ":" + event_params["start_time(5i)"] + "-0600"
      begin
        return DateTime.strptime(start_time, '%Y%m%dT%H:%M%z')
      rescue ArgumentError
        flash[:error] ||= "Start date doesn't exist"
        return nil
      end
    end

    # Returns nil if the time is invalid
    def process_end_time
      if event_params["end_time(2i)"].length == 1
        end_month = "0" + event_params["end_time(2i)"]
      else
        end_month = event_params["end_time(2i)"]
      end

      # -0600 represents the default timezone of CST
      end_time = event_params["end_time(1i)"] + end_month + event_params["end_time(3i)"] + "T" +
        event_params["end_time(4i)"] + ":" + event_params["end_time(5i)"] + "-0600"
      begin
        return DateTime.strptime(end_time, '%Y%m%dT%H:%M%z')
      rescue ArgumentError
        flash[:error] ||= "End date doesn't exist"
        return nil
      end
    end

    def event_params
      params.require(:event).permit(:name, :description, :num_vols, :location,
        :contact_phone, :contact_email, :skills, :end_time, :start_time, :start_date,
        :end_date, :volunteer_count)
    end
end
