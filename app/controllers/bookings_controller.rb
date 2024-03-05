class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.walk = Walk.find(params[:walk_id])
    @booking.walk = @walk
    if @booking.save
      redirect_to booking_path(@booking) # redirect to the dashboard view page to determine
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking) # redirect to the dashboard view page to determine
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :walk_id)
  end
end
