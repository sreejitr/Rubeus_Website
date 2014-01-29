# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    buyer_id 1
    product_id 1
  end

  factory :product_offer, class: Offer do
 	buyer_id 1
    product_id 1
  end
end
