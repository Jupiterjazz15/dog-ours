class PagesController < ApplicationController
  def home
    if user_signed_in?
      @walks = Walk.all
      render 'home'
    else
      render 'welcome'
    end
  end

  def dashboard
    @walks = current_user.walks
  end

  def mywalks
    @walks = current_user.walks
    @bookings = current_user.bookings
  end

  def myrequest
    @walks = current_user.walks
    @bookings = current_user.bookings
  end
end
