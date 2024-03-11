class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[validates refused destroy]

  def index
    @bookings = Booking.where(user: current_user)
    @bookings = policy_scope(Booking)
  end

  def create
    @walk = Walk.find(params[:walk_id])
    @booking = Booking.new
    @message = Message.new
    @booking.walk = @walk
    @booking.user = current_user
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to mywalks_path(created_booking: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validates
    authorize @booking
    @booking.accepted!
    redirect_to dashboard_path
  end

  def refused
    authorize @booking
    @booking.declined!
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
