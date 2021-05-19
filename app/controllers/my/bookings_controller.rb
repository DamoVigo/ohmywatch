    class My::BookingsController < ApplicationController
        def index
            @background = 'background_anrvus.jpg'
            @bookings = Booking.all
          end

          def show
            @booking = Booking.find(params[:id])
          end

          def new
            @booking = Booking.new
          end

          def create
            @booking = Booking.new(booking_params)
            if @booking.save
              redirect_to my_bookings_path
            else
              render :new
            end
          end

          def edit
            @booking = Booking.find(params[:id])
          end

          def update
            @booking = booking.find(params[:id])
            @booking.update(booking_params)

            redirect_to my_booking_path(@booking)
          end

          def destroy
            @booking = Booking.find(params[:id])
            @booking.destroy

            redirect_to my_bookings_path
          end

          private

          def booking_params
            params.require(:booking).permit(:start_date, :end_date, :total_price)
          end
end
