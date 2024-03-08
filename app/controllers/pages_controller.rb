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

  def myprofile

  end
end
