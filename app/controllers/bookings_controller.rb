class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    authorize @booking
    if @booking.save
      redirect_to user_path(current_user)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity)
  end
end
