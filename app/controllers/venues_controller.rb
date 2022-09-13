class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @events = Event.all
    @venue = Venue.find(params[:id])
    authorize @venue
  end

  def new
    @events = Event.all
    @venue = Venue.new
    authorize @venue
  end

  def create
    @events = Event.all
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    authorize @venue
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @events = Event.all
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    authorize @venue
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue = Venue.find(params[:id])
    authorize @venue
    @venue.destroy
  end

  private

  def venue_params
    params.require(:venue).permit(:location, :name, :venue, :about, :website, :facebook, :instagram, :logo, photos: [])
  end
end
