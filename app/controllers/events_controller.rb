class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @events = policy_scope(Event)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @venue = Venue.find(params[:venue_id])
    @event.venue = @venue
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :price, :genre, :category, :producer, :name, :image, :about, :mini_description, :tickets_available, :cash, :card)
  end
end
