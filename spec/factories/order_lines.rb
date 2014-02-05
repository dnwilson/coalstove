# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_line do
    order_id 1
    user_id 1
    menu_id 1
  end
end
