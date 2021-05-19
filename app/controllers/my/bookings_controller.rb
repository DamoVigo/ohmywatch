    class BookingsController < ApplicationController
        def index
            @background = 'background_anrvus.jpg'
            @bookings = Bookings.all
          end
        
          def show
            @booking = Watch.find(params[:id])
          end
        
          def new
            @booking = Booking.new
          end
        
          def create
            @booking = Booking.new(booking_params)
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
            @booking = booking.find(params[:id])
            @booking.update(booking_params)
        
            redirect_to booking_path(@booking)
          end
          
          def destroy
            @booking = Booking.find(params[:id])
            @booking.destroy
          end
        
          private
        
          def booking_params
            params.require(:booking).permit(:start_date, :end_date, :total_price)
          end
    end
    
end
