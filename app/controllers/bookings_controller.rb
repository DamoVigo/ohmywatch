    class BookingsController < ApplicationController
        def index
            @background = 'background_anrvus.jpg'
            @bookings = Booking.where(user: current_user)
          end

          def show
            @booking = Booking.find(params[:id])
          end

          def new
            @watch = Watch.find(params[:watch_id])
            @booking = Booking.new
            @booking.watch = @watch
            @booking.user = current_user
          end

          def create
            @booking = Booking.new(booking_params)
            @booking.user = current_user
            @watch = Watch.find(params[:watch_id])
            @booking.watch = @watch
            if @booking.save
              redirect_to bookings_path
            else
              render :new
            end
          end

          def edit
            @booking = Booking.find(params[:id])
          end

          def update
            @booking = Booking.find(params[:id])
            @booking.update(booking_params)
            @watch = @booking.watch
            redirect_to bookings_path
          end

          def destroy
            @booking = Booking.find(params[:id])
            @booking.destroy
            redirect_to bookings_path
          end

          private

          def booking_params
            params.require(:booking).permit(:start_date, :end_date)
          end
end
