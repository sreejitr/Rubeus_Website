#Create, withdraw offer on particular product and list offers
class OffersController < ApplicationController
  before_filter :authenticate_user!

  #Create new offer for a product when a buyer clicks on 'Show Interest' button
  def new
    @product_id = params[:product_id]
    if @product_id
      @product = Product.find(params[:product_id])
      if @product.seller_user_id != current_user.id
        @duplicate_offer = Offer.where(:buyer_id => current_user.id, :product_id => @product_id)
        if !@duplicate_offer.any?
          @offer = Offer.new
          @offer.buyer_id = current_user.id
          @offer.product_id = @product_id
          @offer.save
          message = Rubeus::SUCCESSFUL_OFFER_MSG
        else
          message = Rubeus::ERROR_OFFER_MSG
        end
      else
        message = Rubeus::ERROR_OFFER_MSG_FOR_SELLER
      end
      redirect_to offers_path, notice: message
    end

  end

  #Withdraw offers
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

 #List offers made by current user
  def index
    @offers= Offer.find_all_by_buyer_id(get_user_id)
  end

  # Not used
  def create
  end

 #Seller accepts offer on product
 def accept
   accepted_offer = Offer.find(params[:id])
   Offer.destroy_all(['id NOT IN (?)', accepted_offer])
   @product=Product.find(accepted_offer.product_id)
   @product.status = Rubeus::SOLD
   @product.save
   create_for_buyer(accepted_offer)
   redirect_to product_path(@product)
 end

  #Creates new product when a buyer's offer is accepted
  def create_for_buyer(accepted_offer)
    @new_product = Product.new(@product.attributes.except('id', 'created_at', 'updated_at'))
    @new_product.seller_user_id = accepted_offer.buyer_id
    @new_product.status = Rubeus::NOT_FOR_SALE
    @new_product.save
  end

end
