class User < ActiveRecord::Base
  belongs_to :college
  has_many :histories
end
