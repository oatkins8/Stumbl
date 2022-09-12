class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    @booking.state = "pending"
    @booking.amount = @event.price * @booking.quantity
    authorize @booking
    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          quantity: 1,
          price_data: {
            unit_amount: @booking.amount.to_s.to_i,
            currency: 'gbp',
            product_data: {
              name: @event.name
            }
          }
        ],
        mode: "payment",
        success_url: user_url(current_user),
        cancel_url: user_url(current_user)
      )
      @booking.update(checkout_session_id: session.id)
      redirect_to new_booking_payment_path(@booking)

    else
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity)
  end
end

# teddy = Teddy.find(params[:teddy_id])
