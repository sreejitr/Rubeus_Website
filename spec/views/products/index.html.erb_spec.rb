#require 'spec_helper'
#
#describe "products/index" do
#  before(:each) do
#    assign(:products, [
#      stub_model(Product,
#        :description => "",
#        :condition => "",
#        :is_sold => "",
#        :status => "",
#        :delete_for => "",
#        :photo => ""
#      ),
#      stub_model(Product,
#        :description => "",
#        :condition => "",
#        :is_sold => "",
#        :status => "",
#        :delete_for => "",
#        :photo => ""
#      )
#    ])
#  end
#
#  it "renders a list of products" do
#    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#    assert_select "tr>td", :text => "".to_s, :count => 2
#  end
#end
