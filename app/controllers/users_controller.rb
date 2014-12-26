class UsersController < ApplicationController
  before_action :authenticate, only: [:show, :edit, :update]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @history = @user.histories.order(created_at: :desc).first
  end

  def edit
    @user = User.find(params[:id])
    redirect_to current_user if @user != current_user
  end

  def update
    @user = User.find(params[:id])
    redirect_to current_user if @user != current_user
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:image_url, :dog_name, :breed, :interests, :college_id)
  end

end
