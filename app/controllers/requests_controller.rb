class RequestsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @requests = @user.received_requests.where(status: "sent")
    @friendship = Friendship.new
  end

  def create
    @user = current_user
    @request = Request.new(requester_id: @user.id, recipient_id: params[:request][:recipient_id])
    @request.save
    redirect_to "/users/#{@request.recipient_id}"
  end

end
