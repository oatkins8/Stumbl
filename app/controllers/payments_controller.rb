class PaymentsController < ApplicationController
  def new
    @events = Event.all
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
    authorize @booking, :payment?
  end
end
