class WalksController < ApplicationController
  before_action :set_walk, only: %i[show edit update destroy]

  def index
    @walks = policy_scope(Walk)
  end

  def new
    @walk = Walk.new
    authorize @walk
  end

  def show
    @walk = Walk.find(params[:id])
    authorize @walk
  end

  def create
    @walk = Walk.new(walk_params)
    @walk.user = current_user
    authorize @walk
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @walk = Walk.find(params[:id])
    authorize @walk
  end

  def update
    @walk = Walk.find(params[:id])
    authorize @walk
    @walk.update(walk_params)
    if @walk.save
      redirect_to walk_path(@walk)
    else
      render :edit, status: :unprocessable_entity # render the edit.html.erb determine the best path to take
    end
  end

  def destroy
    @walk = Walk.find(params[:id])
    authorize @walk
    @walk.destroy
    redirect_to walks_path
  end

  private

  def set_walk
    @walk = Walk.find(params[:id])
  end

  def walk_params
    params.require(:walk).permit(:starting_point, :difficulty, :description, :start_time, :duration, :frequency, :number_of_participant)
  end
end
