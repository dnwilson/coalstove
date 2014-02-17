require 'spec_helper'

describe ItemsController do
	subject { page }

	describe "new item page with guest user" do
		it "should redirect to home page" do
			get '/items/new'
			response.should redirect_to(root_path)
		end
	end

	describe "new page with signed in user" do
		let(:user) { FactoryGirl.create(:user) }
		
		before(:each) do
			visit login_path
			fill_in "Email", 		with: user.email 
			fill_in "Password",		with: user.password
			click_button "Log in"
		end

		it "should redirect to home page" do
			get '/items/new'
			response.should redirect_to(root_path)
		end
	end

	describe "new page with signed in admin" do
		let(:admin) { FactoryGirl.create(:admin) }
		
		before(:each) do
			visit login_path
			fill_in "Email", 		with: admin.email 
			fill_in "Password",		with: admin.password
			click_button "Log in"
			visit new_item_path
		end

		it{should have_selector(".item-input")}
		it{should have_title('coalstove | Items')}
		it{should have_content(:text, 'logout')}

		describe "and no user entered data" do
			before do
			  	fill_in "Item name", 	with: ""
				select "Groceries", 	from: "item[category_id]"
				fill_in "Item amount", 	with: 0
			end

			it "should not create an item" do
				expect {click_button "Create Item"}.not_to change(Item, :count)
			end
		end

		describe "and user entered data" do
			before do
			  	fill_in "Item name", 	with: "Test"
				select 	"Groceries", 	from: "item[category_id]"
				fill_in "Item amount", 	with: 300
			end

			it "should create a new item" do
				expect {click_button "Create Item"}.to change(Item, :count).by(1)
			end

			it "should add new item to item-list" do
				click_button "Create Item"
				should have_selector('span', text: "Test")
			end
		end
	end
end
