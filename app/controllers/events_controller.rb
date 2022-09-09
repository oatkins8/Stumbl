class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # Using search bar to filter events if query was typed...
    if params[:query].present?
      sql_query = <<~SQL
        events.name @@ :query
        OR events.category @@ :query
        OR events.genre @@ :query
        OR events.producer @@ :query
        OR venues.name @@ :query
        OR venues.location @@ :query
      SQL
      # @events is all the events joins with all the venues with the SQL query params applied
      @events = policy_scope(Event).joins(:venue).where(sql_query, query: "%#{params[:query]}%")
    else
      # if nothing is typed in the search it shows all the events..
      @events = policy_scope(Event)
    end
    # we are creating a new array @venues which stores all of the @events that have a geocoded venue attached
    @venues = @events.map do |event|
      event.venue if event.venue.geocoded?
    end
    # Creating a @markers array of hashes which iterates over each venue, if the venue has a nil,
    # value it removes nil(with .compact) the marker to its locations lat and lng.
    @markers = @venues.compact.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: {venue: venue}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def show
    @booking = Booking.new
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
