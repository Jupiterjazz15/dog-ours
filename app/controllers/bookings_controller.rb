class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create]
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :walk_id)
  end
end
