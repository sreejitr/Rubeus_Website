# TBD: Helper Methods specific to products
module ProductsHelper
  # Error message for Products
	def product_error_messages!
     if @product.errors.any?
       @product.errors.full_messages.each do | message|

       end
     end
  end
end
