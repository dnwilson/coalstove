require 'spec_helper'

describe Transaction do
   let(:user){FactoryGirl.create(:user)}
   let(:item){FactoryGirl.create(:item)}
   before{@transaction = Transaction.new(user_id: user.id,
      item_id: item.id,
      trans_date: "1/2/2014",
      trans_amount: 400)}
      
      subject{@transaction}
      
      it{should respond_to(:user)}
      it{should respond_to(:items)}
      it{should respond_to(:user_id)}
      it{should respond_to(:item_id)}
      it{should respond_to(:trans_amount)}
      it{should respond_to(:trans_date)}
      it{should have_many(:items)}
      it{should belong_to(:user)}
      
      its(:user){should == user}
      
      it{should be_valid}
      
      
      describe "when user_id is not present" do
         before{@transaction.user_id = nil}
         it{should_not be_valid}
      end
      
      describe "when item_id is not present" do
         before{@transaction.item_id = nil}
         it{should_not be_valid}
      end
      
      describe "when trans_amount is not present" do
         before{@transaction.trans_amount = nil}
         it{should_not be_valid}
      end
      
      describe "when trans_amount is not a number" do
         before{@transaction.trans_amount = "nil"}
         it{should_not be_valid}
      end
      
      describe "when incorrect date is entered" do
         before{@transaction.trans_date = '30/2/2013'}
         it{should_not be_valid}
      end
      
      describe "when future date is entered" do
         before{@transaction.trans_date = '25/2/2014'}
         it{should_not be_valid}
      end
end