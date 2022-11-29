class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_user!, only: [:toggle_favorite]

  def index
    @events = policy_scope(Event)
    params.delete_if { |key, _| params[key] == 'Any'}
    @events = Event.filter(params.slice(:category, :genre))
    @events = @events.select { |event| event.price_range == params[:price] } if params[:price].present?

    @venues = @events.map do |event|
      event.venue if event.venue.geocoded?
    end

    if params[:location].present?
      near = Venue.near(params[:location], params[:radius], units: :km)
      @venues = @venues.select { |venue| near.include?(venue) }
    end

    # Creating a @markers array of hashes which iterates over each venue, if the venue has a nil,
    # value it removes nil(with .compact) the marker to its locations lat and lng.
    @markers = @venues.compact.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: {venue: venue}),
        image_url: helpers.asset_url("stumbl_logo.png")
      }
    end
  end

  def show
    @events = Event.all
    @booking = Booking.new
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @events = Event.all
    @event = Event.new
    @venue = Venue.find(params[:venue_id])
    authorize @event
  end

  def create
    @events = Event.all
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
    @venue = @event.venue
    authorize @event
    @event.destroy
    redirect_to venue_path(@venue)
  end

  def edit
    @events = Event.all
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def toggle_favorite
    @event = Event.find(params[:id])
    authorize @event
    current_user.favorited?(@event) ? current_user.unfavorite(@event) : current_user.favorite(@event)

    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.json
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :price, :genre, :category, :producer, :name, :about, :mini_description, :tickets_available, :cash, :card, images: [],)
  end
end
