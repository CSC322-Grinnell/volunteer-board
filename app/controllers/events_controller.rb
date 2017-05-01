class EventsController < InheritedResources::Base

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
      params.require(:event).permit(:name, :description, :start_time, :end_time, :num_vols, :location, :contact_phone, :contact_email)
    end
end

