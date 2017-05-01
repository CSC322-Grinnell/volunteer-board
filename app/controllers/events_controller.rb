class EventsController < InheritedResources::Base
  
  def sign_up
    @event = Event.find(params[:id])
    if user_signed_in?
      current_user.events << @event
    end
    redirect_to action: "show", id: @event.id
  end
  
  def deregister
    @event = Event.find(params[:id])
    if user_signed_in?
      current_user.events.delete(@event)
    end
    redirect_to action: "show", id: @event.id
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :num_vols, :location, :contact_phone, :contact_email)
    end
    
    #def show
    #   puts "*** Showing"
    # end
    

end

