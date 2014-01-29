# Created dummy users controller (This was not created as part of devise gem)
# Inherits from ApplicationController. The User MODEL uses Devise, not the Controller.
class UsersController < ApplicationController
  # Devise views are being used. Show details of users with id params[:id]??

  before_filter :authenticate_user!

  #Show user profile page
  def show
    @user = User.find(params[:id])
    products = Product.find_all_by_seller_user_id(params[:id])
    @sold_products =  products.select{|p| p.status == Rubeus::SOLD}
    @owned_products = products.select{|p| p.status != Rubeus::SOLD}
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  #Edit user profile
  def edit
    @user = User.find(params[:id])
  end

  #Update user profile
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile changes were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end