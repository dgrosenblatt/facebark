class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @histories = @user.histories
  end

  def new
    @user = User.find(params[:user_id])
    @history = @user.histories.order(created_at: :desc).first
  end

  def create
    @user = User.find(params[:user_id])
    @history = History.new(user_id: @user.id, body: params[:history][:body])
    @history.save
    redirect_to @user
  end

end
