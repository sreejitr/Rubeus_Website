require 'spec_helper'

describe "Profile page" do
  before :each do
    @user = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product)
    @laptop= FactoryGirl.create(:product, :title => 'Laptop', :status => Rubeus::SOLD)
    sign_in_with_valid_credentials(@user)
    visit user_path(@user.id)
  end

  it "has username header" do
    page.should have_content(@user.name)
  end

  it "has sold product list" do
    page.should have_content(Rubeus::SOLD_PRODUCTS)
    sold_products = find('#sold_product_list')

    sold_products.should have_content(@laptop.title)
    #sold_products.should have_content(@laptop.category)
    #sold_products.should have_content(@laptop.condition)
    #sold_products.should have_content(@laptop.description)
    #sold_products.should have_content(@laptop.price)

  end

  it "has location info" do
    page.should have_content(Rubeus::LOCATION)
    page.should have_content(@user.address)
    page.should have_content(@user.city)
    page.should have_content(@user.state)
    page.should have_content(@user.zip_code)
  end

  it "has contact info" do
    page.should have_content(Rubeus::CONTACT)
    page.should have_content(@user.email)
    page.should have_content(@user.phone_no)
  end

  it "has owned product list" do
    page.should have_content(Rubeus::OWNED_PRODUCTS)
    owned_products = find('#owned_product_list')

    owned_products.should have_content(@product.title)
    #owned_products.should have_content(@product.category)
    #owned_products.should have_content(@product.condition)
    #owned_products.should have_content(@product.description)
    #owned_products.should have_content(@product.price)

  end
end