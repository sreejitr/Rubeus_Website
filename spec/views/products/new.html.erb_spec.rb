#require 'spec_helper'
#
#describe "products/new" do
#  before(:each) do
#    assign(:product, stub_model(Product,
#      :description => "a",
#      :condition => "a",
#      :is_sold => false,
#      :status => false,
#      :delete_for => false,
#      :photo => "a"
#    ).as_new_record)
#  end
#
#  #it "renders new product form" do
#  #  render
#  #
#  #  # Run the generator again with the --webrat flag if you want to use webrat matchers
#  #  assert_select "form[action=?][method=?]", products_path, "post" do
#  #    assert_select "input#product_description[name=?]", "product[description]"
#  #    assert_select "input#product_condition[name=?]", "product[condition]"
#  #    assert_select "input#product_is_sold[name=?]", "product[is_sold]"
#  #    assert_select "input#product_for_sale[name=?]", "product[status]"
#  #    assert_select "input#product_delete_for[name=?]", "product[delete_for]"
#  #    assert_select "input#product_photo[name=?]", "product[photo]"
#  #  end
#  #end
#end
