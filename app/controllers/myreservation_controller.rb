class MyreservationController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @background = 'background_anrvus.jpg'
    @watches = Watch.where(user: current_user)
    @bookings = Booking.where(watch: @watches)
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :end_date)
  end
end
