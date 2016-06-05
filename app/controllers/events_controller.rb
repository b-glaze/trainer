class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(permit_event)
		@event.save
		redirect_to event_path(@event)
	end

	def index
		@events = Event.all
		# right now this says all events
		# make it so that it only gets the events that belongs to the current user logged in
	end

	def show
		@event = Event.find(params[:id])
	end

	private

		def permit_event
			params.require(:event).permit(:title, :description, :price, :time, :cover, :confirm)
		end
end
