class Request < ActiveRecord::Base
  belongs_to :requester, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
