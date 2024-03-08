class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.walk = Walk.find(params[:walk_id])
    @booking.walk = @walk
    if @booking.save
      redirect_to booking_path(@booking) # redirect to the dashboard view page to determine
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validates
    @booking.accepted!
    redirect_to dashboard_path
  end

  def refused
    @booking.declined!
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
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
