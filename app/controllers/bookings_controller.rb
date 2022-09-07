class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    if @booking.save
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity)
  end
end
