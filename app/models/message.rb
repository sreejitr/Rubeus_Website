#Communication between buyer and seller
class Message < ActiveRecord::Base
  is_private_message
  attr_accessible :body, :created_at, :recipient_id, :sender_id
  validates_presence_of :body,:recipient_id,:sender_id
end