class My::BookingsController < ApplicationController
        def index
            @background = 'background_anrvus.jpg'
            @bookings = Booking.all
          end

          def show
            @booking = Booking.find(params[:id])
          end

          def new
            @watch = Watch.find(params[:watch_id])
            @booking = Booking.new
            @booking.watch = @watch
            @user = current_user
          end

          def create
            @booking = Booking.new(booking_params)
            @user = current_user
            @watch = Watch.find(params[:watch_id])
            @booking.watch = @watch
            raise
            if @booking.save
              redirect_to watch_bookings_path
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
