class RequestsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @requests = @user.received_requests.where(status: "sent")
    @friendship = Friendship.new
  end

end
