# Defining methods for product model
class ProductsController < ApplicationController
  # Except for index and show actions on product, users authentication is required
  before_filter :authenticate_user!, :except => [:index, :show, :search]
  # GET /products
  # GET /products.json
  # respond_with: Refactored code for respond_to do |format| .. end  for html and xml
  respond_to :html, :json
  # Lists all products
  def index
      @products = Product.where(:status => Rubeus::FOR_SALE)
      if user_signed_in?
        @user_id = current_user.id
      end
      @title = "Products"
      respond_with(@products)
  end

  #Lists all products belonging to the signed in user
  def current_user_product_index
    get_user_id
    @products = Product.find_all_by_seller_user_id(current_user.id)
    @title = "My Products"
    render 'index'
  end

  # GET /products/1
  # GET /products/1.json
  # Lists/Displays a particular product
  def show
      @product = Product.find(params[:id])
      if user_signed_in?
        @is_signed_in_user_the_owner = @product.seller_user_id == current_user.id
      end
      if @is_signed_in_user_the_owner
        @offer = @product.offers
      else
       # @offer = @product.offers.build
      end
      if current_user
        @user = User.find(current_user.id)
      end
      respond_with(@product)
  end

  # GET /products/new
  # GET /products/new.json
  # Create a new product, redirects to create product form
  def new
    @product = Product.new
    respond_with(@product)
  end

  # GET /products/1/edit
  # Edit product details for product with productID id
  def edit
    get_user_id
    @product = Product.find(params[:id])
    if is_product_sold?
      redirect_back_with_sold_alert
    end
  end

  # POST /products
  # POST /products.json
  # Create a new product with given form parameters
  def create
    #can't refactor this part of the code as seller_user_id reference is not
    #same as user_id ie we can't execute method current_user.products
    @product = Product.new(params[:product])
    @product.seller_user_id = current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render "new"}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  # Update product details for product with productID id
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  # Delete product with productID id
  def destroy
    @product = Product.find(params[:id])
    if is_product_sold?
      redirect_back_with_sold_alert
    else
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url }
        format.json { head :no_content }
      end
    end

  end

  #Search for products by keyword
  def search
    @search_param = params[:q]
    @user_id = get_user_id
    @products = Product.search(@search_param)
    render "index"
  end

  #Flash message when user tries to edit a sold product
  def redirect_back_with_sold_alert
    flash[:alert] = Rubeus::NOT_EDITABLE_MSG
    #Redirect the user to the home page if no referer (example: directly typing in the URL for the action)
    request.env["HTTP_REFERER"] ||= root_path
    redirect_to :back
  end

  #Check for product status
  def is_product_sold?
    @product.status==Rubeus::SOLD
  end
end
