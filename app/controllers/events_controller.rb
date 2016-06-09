class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(permit_event)
		@event.user_id = current_user.id
		if @event.save
			redirect_to event_path(@event)
		else 
			flash[:red] = @event.errors.full_messages[0]
			render "new"
		end	
	end

	def index
		@events = Event.where(user_id: current_user.id)
	end

	def show
		@event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
		if @event.user_id == current_user.id
			@event.delete
			redirect_to events_path
		else 
			flash[:red] = "You cannot delete this event."
			redirect_to events_path
		end	
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(permit_event)
			flash[:success] = "Event updated!"
			redirect_to event_path(@event)
		else
			flash[:whoops] = @event.errors.full_messages.first
			redirect_to event_path
	    end
	end

	private

		def permit_event
			params.require(:event).permit(:title, :description, :price, :time, :cover, :confirm)
		end
end
