class EventsController < InheritedResources::Base
  
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      current_user.events << @event
      @event.volunteer_count ||= 0
      @event.volunteer_count = @event.volunteer_count + 1
      @event.save
    end
    redirect_to action: "show", id: @event.id
  end
  
  def deregister
    @event = Event.find(params[:id])
    if user_signed_in?
      current_user.events.delete(@event)
      @event.volunteer_count ||= 0
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
  
  def after_initialize
    if new_record?
      volunteer_count ||= 0
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

