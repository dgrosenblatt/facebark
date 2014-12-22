class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @history = @user.histories.order(created_at: :desc).first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:image_url, :dog_name, :breed, :interests, :college_id)
  end

end