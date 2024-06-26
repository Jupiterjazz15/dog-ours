class PagesController < ApplicationController
  def welcome
  end

  def error
    render file: "#{Rails.root}/public/error.html", layout: false
  end

  def timeout
  end

  def home
    if user_signed_in?
      walk_ids = Walk.select("user_id, min(id) as id").
        where(parent_id: nil).
        group(:user_id).
        order("RANDOM()").
        limit(10).
        map(&:id)

      @walks = Walk.where(id: walk_ids)

      @markers = @walks.geocoded.map do |walk|
        {
          lat: walk.latitude,
          lng: walk.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
          marker_html: render_to_string(partial: "marker", locals: { walk: walk })
        }
      end
    else
      @walks = []
    end
  end

  def dashboard
    @created_walk = params[:created_walk] == "true"
    @created_booking = params[:created_booking] == "true"
    @my_bookings = current_user.bookings.map(&:walk)
    if params[:id].present?
      @booking = Booking.find(params[:id])
    end
    @my_walks = Walk.where(user: current_user, parent_id: nil)
    @dashboard_walks = (@my_walks + @my_bookings).sort_by(&:start_time)
  end

  def mywalks
    @created_walk = params[:created_walk] == "true"
    @created_booking = params[:created_booking] == "true"
    @walks = current_user.walks
    @bookings = current_user.bookings
    @my_walks = Walk.where(user: current_user, parent_id: nil)
  end

  def myrequest
    @walks = current_user.walks
    @bookings = current_user.bookings
  end

  def myprofile
  end
end
