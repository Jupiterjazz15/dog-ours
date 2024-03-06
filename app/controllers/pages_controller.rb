class PagesController < ApplicationController
  def home
    @walks = Walk.all
  end
end
