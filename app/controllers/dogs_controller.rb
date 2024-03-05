class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def new
    authorize @dog
    @dog = Dog.new
  end

  def show
    authorize @dog
    @dog = Dog.find(params[:id])
  end

  def create
    authorize @dog
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dashboard_path(@dog)
    else
      render :new # render the new.html.erb
    end
  end

  def edit
    authorize @dog
    @dog = Dog.find(params[:id])
  end

  def update
    authorize @dog
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    if @dog.save
      redirect_to dog_path(@dog) # redirect to the dog view page
    else
      render :edit, status: :unprocessable_entity # render the edit.html.erb determine the best path to take
    end
  end

  def destroy
    authorize @dog
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :birth_date, :photo, :breed_id, :size, :picture, :fun_fact, :constraint)
  end
end
