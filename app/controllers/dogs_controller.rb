class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.save
    redirect_to dog_path(@dog)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :birth_date, :breed_id, :size, :picture, :fun_fact, :constraint)
  end
end
