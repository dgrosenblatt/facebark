class FriendshipsController < ApplicationController
  before_action :authenticate, only: [:create]
  def create
    @user = User.find(params[:user_id])
    @friendship = Friendship.new(user_id: @user.id,
                                 friend_id: params[:friendship][:friend_id])

    @request = Request.find_by(requester_id: params[:friendship][:friend_id],
                               recipient_id: @user.id,
                               status: "sent")
    if @request
      @friendship.save
      @request.update_attributes(status: "accepted")
    end
    redirect_to user_requests_path(@user)
  end
end
