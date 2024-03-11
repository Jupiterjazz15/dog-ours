class WalksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_walk, only: %i[show edit update destroy]

  def index
    @walks = Walk.all
    @walks = policy_scope(Walk)
    @walks = Walk.all # select * from walks

    if params[:query].present?
      sql_subquery = "starting_point ILIKE :query"
      @walks = @walks.where(sql_subquery, { query: "%#{params[:query]}%" })
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
    @walk = Walk.find(params[:id])
    @message = Message.new
    @booking = Booking.new
    authorize @walk
    if @walk.geocoded?
      @markers = [
        {
          lat: @walk.latitude,
          lng: @walk.longitude,
          marker_html: render_to_string(partial: "marker", locals: { walk: @walk }),
          info_window_html: render_to_string(partial: "info_window", locals: { walk: @walk })
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
      create_dependent_walks_for(@walk)
      redirect_to mywalks_path(created_walk: true)
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
      redirect_to walk_path(@walk)
    else
      render :edit, status: :unprocessable_entity # render the edit.html.erb determine the best path to take
    end
  end

  def destroy
    @walk.destroy
    authorize @walk
    redirect_to walks_path
  end

  def discussion
    @walk = Walk.find(params[:id])
    @booking = Booking.find_by(walk: @walk, user: current_user)
    @message = Message.new
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit(:starting_point, :difficulty, :description, :start_time, :duration, :frequency, :number_of_participant, :name)
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
          parent: walk
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
          parent: walk
        )
      end
    else
      @walk.save
    end
  end
end
