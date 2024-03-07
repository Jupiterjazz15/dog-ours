class PagesController < ApplicationController
  def home
    if user_signed_in?
      @walks = Walk.all
      render 'home'
    else
      render 'welcome'
    end
  end

  def myprofile
  end
end
