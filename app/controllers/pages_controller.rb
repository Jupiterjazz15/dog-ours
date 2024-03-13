class PagesController < ApplicationController
  def home
    if user_signed_in?
      @walks = Walk.all
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
    @walks = current_user.walks
    # @walks = current_user.walks.where.not(parent_id: nil)
  end

  def mywalks
    @created_walk = params[:created_walk] == "true"
    @created_booking = params[:created_booking] == "true"
    @walks = current_user.walks
    @bookings = current_user.bookings
  end

  def myrequest
    @walks = current_user.walks
    @bookings = current_user.bookings
  end
end
