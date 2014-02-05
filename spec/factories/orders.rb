# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    menu_id 1
    order_delivery false
    order_notes "MyString"
    order_total 1
  end
end
