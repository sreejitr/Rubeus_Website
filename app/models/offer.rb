#Offer model serves as transaction history between buyer and seller
#Buyer shows interest through this model
class Offer < ActiveRecord::Base
  attr_accessible :buyer_id, :product_id
  validates_presence_of :buyer_id, :product_id
  belongs_to :product
  belongs_to :user, :foreign_key => :buyer_id
  #Doesn't seem like this is being used anywhere. So commenting it out
  #default_scope order: 'offers.created_at DESC'
end
