class PagesController < ApplicationController
  def home
    @walks = Walk.all
  end

  def myprofile
  end
end
