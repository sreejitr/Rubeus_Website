# Devise users model created using devise gem
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Validation tests for users
  validates :name, :presence => true
  #validates :address, :presence => true
  #validates :phone_no, :presence => true,   :numericality => true
  validates :city, :presence => true
  #validates :state, :presence => true
  #validates :zip_code, :presence => true, :numericality => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation,
                  :remember_me, :address, :city, :state, :zip_code, :phone_no
  has_many :product
  has_many :offers
  has_private_messages
  # attr_accessible :title, :body
end
