class RequestsController < ApplicationController
  before_action :authenticate, only: [:index, :create]

  def index
    @user = User.find(params[:user_id])
    if current_user == @user
      @requests = @user.received_requests.where(status: "sent")
      @friendship = Friendship.new
    else
      redirect_to current_user, notice: "Only you can prevent forest fires!"
    end
  end

  def create
    @user = current_user
    @request = Request.new(requester_id: @user.id, recipient_id: params[:request][:recipient_id])
    @request.save
    redirect_to "/users/#{@request.recipient_id}"
  end

end
