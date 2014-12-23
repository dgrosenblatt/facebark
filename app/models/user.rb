class User < ActiveRecord::Base
  belongs_to :college
  has_many :histories
  has_many :sent_requests, class_name: "Request", foreign_key: "requester_id"
  has_many :received_requests, class_name: "Request", foreign_key: "recipient_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def all_friends
    friends = []
    self.friendships.each { |friendship| friends << friendship.friend }
    self.inverse_friendships.each { |friendship| friends << friendship.user }
    friends
  end
end
