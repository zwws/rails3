class EventsController < ApplicationController
	before_filter :find_event, :only => [:show, :edit, :update, :destroy]

	def index
		@events = Event.page(params[:page]).per(2)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event])
		unless @event.save
			render :action => :new
		else
			flash[:notice] = 'event was successfully created'
			redirect_to :action => :index
		end
	end

	def show
	end

	def edit 
	end

	def update
		if @event.update_attributes(params[:event])
			flash[:notice] = 'event was successfully updated'
			redirect_to :action => :show, :id => @event
		else
			render :action => edit
		end
	end

	def destroy
		@event.destroy

		flash[:notice] = 'event was successfully deleted'
		redirect_to :action => :index
	end

	protected 
	def find_event
		@event = Event.find(params[:id])
	end
end
