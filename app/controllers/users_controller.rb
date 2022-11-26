class UsersController < ApplicationController

    def show
    @skip_navbar = true
    @events = Event.all
    @bookings = Booking.where(user_id: params[:id])
    @venues = Venue.where(user_id: params[:id])
    authorize current_user
  end
end
