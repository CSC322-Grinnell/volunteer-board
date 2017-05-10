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
      :num_vols, :location, :contact_phone, :contact_email, :hour, :minute, :ampm, :start_date, :end_date)
    end

end