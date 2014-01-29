# Product model
class Product < ActiveRecord::Base
  # Attributes for product model
  # delete_for : This is used to delete product for a users. Possible values: "", seller_id, buyer_id
  attr_accessible :description, :condition, :photo, :photo_cache, :title,:category, :delete_for, :status, :is_sold, :seller_user_id,
                  :buyer_user_id, :price

  # description, condition : mandatory fields while creating product
  validates_presence_of :description, :condition, :title, :price
  validates_numericality_of :price
  validates :status,
            :inclusion  => { :in => [ Rubeus::NOT_FOR_SALE, Rubeus::FOR_SALE, Rubeus::SOLD] ,
            :message    => "%{value} is not a valid product status" }
  belongs_to :user, foreign_key: 'seller_user_id'
  has_many :offers, dependent: :destroy
  #mounts the uploader so that users can upload images
  mount_uploader :photo, ProductImageUploader
  before_validation :default_values
   scope :search, lambda{|search_param| { :conditions => ["title LIKE ? OR description LIKE ? OR category LIKE ?
                                        AND status = '#{Rubeus::FOR_SALE}'","%#{search_param}%", "%#{search_param}%",
                                                          "%#{search_param}%"] } }

  #Set default value for status attribute before validation
  def default_values
    self.status ||= Rubeus::NOT_FOR_SALE
  end

  # Get latest products for carousel
  def self.for_carousel
    Product.where(:status => Rubeus::FOR_SALE).order('created_at DESC').limit(5).all
  end

end
