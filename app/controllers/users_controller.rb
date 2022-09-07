class UsersController < ApplicationController

  def show
    @user = current_user
    @bookings = Booking.where(user_id: params[:id])
    @venues = Venue.where(user_id: params[:id])
    authorize @user
  end
end
