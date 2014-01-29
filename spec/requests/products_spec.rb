require 'spec_helper'

describe "Products" do
  describe "GET /products" do

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get products_path
      response.status.should be(200)
    end
    it 'should edit product' do

      #I think we need to sign a user in, but this helper isn't working.
      #signin_user
      @prod = Product.new({description: "Small Dining table for two", condition: "fair", title: "Table", price: 100, status: Rubeus::NOT_FOR_SALE})
      @prod.save
      get edit_product_path(@prod)
      #assert assigns(:product)
      #todo: Write better testcase for edit to check if we have updated the description
    end
  end
end
