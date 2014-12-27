class User < ActiveRecord::Base
  belongs_to :college
  has_many :histories
  has_many :sent_requests, class_name: "Request", foreign_key: "requester_id"
  has_many :received_requests, class_name: "Request", foreign_key: "recipient_id"
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def all_friends
    friends = []
    self.friendships.each { |friendship| friends << friendship.friend }
    self.inverse_friendships.each { |friendship| friends << friendship.user }
    friends
  end

  def outstanding_requests
    self.sent_requests.map {|req| req.recipient if req.status == "sent"}
  end

end
