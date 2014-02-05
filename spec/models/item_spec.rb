require 'spec_helper'

describe Item do
   before{ @item = Item.new(item_name: "Item",
      category_id: 1,
      item_amount: 500 )}
      
      subject{@item}
      
      it{should respond_to(:item_name)}
      it{should respond_to(:item_amount)}
      it{should respond_to(:category_id)}
      it{should have_one(:category)}
      it{should have_many(:transactions)}
      
      it{should be_valid}
      
      describe "when category_id is not present" do
         before{@item.category_id = nil}
         it{should_not be_valid}
      end
      
      describe "when item_name is not present" do
         before{@item.item_name = nil}
         it{should_not be_valid}
      end
      
      describe "when item_name is less than 4 characters" do
         before{@item.item_name = "pig"}
         it{should_not be_valid}
      end
      
      describe "when item_amount is not present" do
         before{@item.item_amount = nil}
         it{should_not be_valid}
      end
      
      describe "when item_amount is less than 0" do
         before{@item.item_amount = -1}
         it{should_not be_valid}
      end
end
