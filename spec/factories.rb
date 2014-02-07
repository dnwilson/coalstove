FactoryGirl.define do
   factory :user do  
      sequence(:email)        {Forgery::Internet.email_address}
      password                "password"
      password_confirmation   "password"
   end

   factory :admin, class: User do
      sequence(:email)        {Forgery::Internet.email_address}
      password                "password"
      password_confirmation   "password"
      admin true
   end
   
   factory :item do
      item_name         "Some Item"
      category_id       1
      item_amount       200
   end
   
   factory :transaction do
      trans_date        "2013-02-01"
      trans_amount      500
      item
      user
      
   end
end