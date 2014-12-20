class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @histories = @user.histories
  end
end
