<<<<<<< HEAD:app/controllers/bookings_controller.rb
    class BookingsController < ApplicationController
=======

    class My::BookingsController < ApplicationController
>>>>>>> ee9b0f5548950f144545d8d1d25469cf8fef8bed:app/controllers/my/bookings_controller.rb
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
