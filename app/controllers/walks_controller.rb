class WalksController < ApplicationController
  before_action :set_walk, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create destroy edit update]
  def index
    authorize @walk
    @walks = Walk.all
  end

  def new
    authorize @walk
    @walk = Walk.new
  end

  def show
    authorize @walk
    @walk = Walk.find(params[:id])
  end

  def create
    authorize @walk
    @walk = Walk.new(walk_params)
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @walk
    @walk = Walk.find(params[:id])
  end

  def update
    authorize @walk
    @walk = Walk.find(params[:id])
    @walk.update(walk_params)
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :edit, status: :unprocessable_entity # render the edit.html.erb determine the best path to take
    end
  end

  def destroy
    authorize @walk
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
