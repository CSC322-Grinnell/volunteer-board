class EventsController < InheritedResources::Base

  private

    def event_params
      params.require(:event).permit(:name, :description, :start_time, :end_time, :num_vols, :location, :contact_phone, :contact_email)
    end
end

