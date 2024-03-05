class UserTagsController < ApplicationController
  
  def create
    @user_tag = UserTag.new(user_tag_params)
    @user_tag.save
    redirect_to user_path(@user_tag.user)
  end

  def destroy
    @user_tag = UserTag.find(params[:id])
    @user_tag.destroy
    redirect_to user_path(@user_tag.user)
  end
end
