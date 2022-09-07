class BookingsController < ApplicationController



  private

  def booking_params
    params.require(:bookings).permit(:quantity)
  end
end
