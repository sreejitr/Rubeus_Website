# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 		 "test"
    email    "test@rubeus.edu"
    password "password"
    password_confirmation "password"
    phone_no "0987654321"
    address "Shadyside"
    city "Pittsburgh"
    state "Pennsylvania"
    zip_code "15232"
    #phone "4121231234"
    #other variables?
    # initialize_with {attributes}
  end
end

