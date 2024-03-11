class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]

  def create
    @booking = Booking.new
    @walk = Walk.find(params[:walk_id])
    @booking.walk = @walk
    @booking.user = current_user
    @booking.status = "pending"

    authorize @booking
    if @booking.save
      redirect_to dashboard_path
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
end
