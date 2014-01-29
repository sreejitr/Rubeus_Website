#require 'spec_helper'
#
#describe "products/edit" do
#  before(:each) do
#    @product = assign(:product, stub_model(Product,
#      :description => "",
#      :condition => "",
#      :is_sold => "",
#      :status => "",
#      :delete_for => "",
#      :photo => ""
#    ))
#  end
#
#  it "renders the edit product form" do
#    render
#
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "form[action=?][method=?]", product_path(@product), "post" do
#      assert_select "input#product_description[name=?]", "product[description]"
#      assert_select "input#product_condition[name=?]", "product[condition]"
#      assert_select "input#product_is_sold[name=?]", "product[is_sold]"
#      assert_select "input#product_for_sale[name=?]", "product[status]"
#      assert_select "input#product_delete_for[name=?]", "product[delete_for]"
#      assert_select "input#product_photo[name=?]", "product[photo]"
#    end
#  end
#end
