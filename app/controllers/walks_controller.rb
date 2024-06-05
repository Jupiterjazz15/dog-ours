class WalksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_walk, only: %i[show edit update destroy]
  before_action :check_user_has_dog, only: %i[new create]

  def index
    @walks = Walk.all
    @walks = policy_scope(Walk)
    # @walks = Walk.all # select * from walks

    if params[:query].present?
      @walks = @walks.where("starting_point ILIKE :query", query: "%#{params[:query]}%")
    end

    if params[:start_time].present?
      start_date = Date.parse(params[:start_time])
      end_date = start_date.end_of_day
      @walks = @walks.where(start_time: start_date..end_date)
    end
    @markers = @walks.geocoded.map do |walk|
      {
        lat: walk.latitude,
        lng: walk.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
        marker_html: render_to_string(partial: "marker", locals: { walk: walk })
      }
    end
  end

  def new
    @walk = Walk.new
    authorize @walk
  end

  def show
    @message = Message.new
    authorize @walk
    if @walk.geocoded?
      @markers = [
        {
          lat: @walk.latitude,
          lng: @walk.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { walk: @walk }),
          marker_html: render_to_string(partial: "marker", locals: { walk: @walk })
        }
      ]
    end
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.user = current_user
    @message = Message.new
    authorize @walk
    if @walk.save
      @booking = Booking.new(walk: @walk, user: current_user, status: "accepted")
      create_dependent_walks_for(@walk)
      @booking = Booking.create(walk: @walk, user: current_user, status: "accepted")
      redirect_to dashboard_path(created_walk: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @walk = Walk.find(params[:id])
    authorize @walk
  end

  def update
    @walk = Walk.find(params[:id])
    authorize @walk
    @walk.update(walk_params)
    if @walk.save
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @walk.destroy
    authorize @walk
    redirect_to dashboard_path
  end

  def discussion
    @walk = Walk.find(params[:id])
    authorize @walk
    @booking = Booking.find_by(walk: @walk, user: current_user)
    @message = Message.new
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def check_user_has_dog
    @user_has_dog = user_has_dog?
  end

  def user_has_dog?
    current_user.dogs.any?
  end

  def walk_params
    params.require(:walk).permit(:starting_point, :difficulty, :description, :start_time, :duration, :frequency, :number_of_participant, :name, :dog_id)
  end

  def create_dependent_walks_for(walk)
    case walk.frequency
    when "Every day"
      13.times do |number|
        Walk.create(
          start_time: walk.start_time + (number + 1).days,
          starting_point: walk.starting_point,
          duration: walk.duration,
          difficulty: walk.difficulty,
          description: walk.description,
          frequency: walk.frequency,
          number_of_participant: walk.number_of_participant,
          longitude: walk.longitude,
          latitude: walk.latitude,
          user: walk.user,
          parent: walk,
          dog: walk.dog
        )
      end
    when "Every other day"
      6.times do |number|
        Walk.create(
          start_time: walk.start_time + (number + 2).days,
          starting_point: walk.starting_point,
          duration: walk.duration,
          difficulty: walk.difficulty,
          description: walk.description,
          frequency: walk.frequency,
          number_of_participant: walk.number_of_participant,
          longitude: walk.longitude,
          latitude: walk.latitude,
          user: walk.user,
          parent: walk,
          dog: walk.dog
        )
      end
    else
      @walk.save
    end
  end
end
