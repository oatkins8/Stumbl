class VenuesController < ApplicationController

  def show
    @venue = Venue.find(params[:id])
    authorize @venue
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
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
    params.require(:venue).permit(:location, :name, :photos, :venue, :about, :website, :facebook, :instagram, :logo)
  end
end
