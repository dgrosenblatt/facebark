class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    History.create(user_id: @user.id, body: params[:user][:wall])
    @user.update_attributes(wall: params[:user][:wall])
    redirect_to @user
  end

end
