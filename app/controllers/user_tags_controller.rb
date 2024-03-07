class UserTagsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user_tag = UserTag.new(user_tag_params)
    if @user_tag.save
      redirect_to user_path(@user_tag.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_tag = UserTag.find(params[:id])
    @user_tag.destroy
    redirect_to user_path(@user_tag.user)
  end
end
