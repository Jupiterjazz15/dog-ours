class PagesController < ApplicationController
  def home
    if user_signed_in?
      walk_ids = Walk.select("user_id, min(id) as id").
        where(parent_id: nil).
        group(:user_id).
        order("RANDOM()").
        limit(5).
        map(&:id)

      @walks   = Walk.where(id: walk_ids)

      @markers = @walks.geocoded.map do |walk|
        {
          lat: walk.latitude,
          lng: walk.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
          marker_html: render_to_string(partial: "marker", locals: { walk: walk })
        }
      end
      render 'home'
    else
      render 'welcome'
    end
  end

  def dashboard
    @created_walk = params[:created_walk] == "true"
    @created_booking = params[:created_booking] == "true"
    @walks = current_user.walks
    @bookings = current_user.bookings
    @my_walks = Walk.where(user: current_user, parent_id: nil)
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
