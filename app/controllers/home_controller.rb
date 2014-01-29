# To be our static home page
class HomeController < ApplicationController

  #Displaying Name of Signed in user and a carousel containing the latest products put up for sale (5)
  def index
    get_user_id
    if @user_id
      @name = User.find(@user_id).name
    else
      @name = 'Guest'
    end

    #get the latest products to display on the home page
    @carousel_products = Product.for_carousel
  end
end
