# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    description "A blue chair"
    condition "Good"
    title "Chair"
    seller_user_id 1
    price 10
    status Rubeus::FOR_SALE
  end
end
