class WalksController < ApplicationController
  before_action :set_walk, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  def index
    @walks = Walk.all
  end

  def new
    @walk = Walk.new
  end

  def show
    @walk = Walk.find(params[:id])
  end

  def create
    @walk = Walk.new(walk_params)
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @walk = Walk.find(params[:id])
  end

  def update
    @walk = Walk.find(params[:id])
    @walk.update(walk_params)
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :edit, status: :unprocessable_entity # render the edit.html.erb determine the best path to take
    end
  end

  def destroy
    @walk = Walk.find(params[:id])
    @walk.destroy
    redirect_to walks_path
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit(:name, :description, :date, :duration, :picture, :constraint)
  end
end
