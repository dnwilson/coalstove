require 'spec_helper'

describe TransactionsController do
	subject{page}

	describe "new transaction page with guest user" do
		it "should redirect to home page with permissions error" do
			get 'transactions/new'
			response.should redirect_to(root_path)
		end
	end

	describe "new transaction with signed in admin" do
		let(:admin) { FactoryGirl.create(:admin) }
		
		before(:each) do
			visit login_path
			fill_in "Email", 		with: admin.email 
			fill_in "Password",		with: admin.password
			click_button "Log in"
			visit new_transaction_path
		end

		it{should have_selector(".item-input")}
		it{should have_title('coalstove | Items')}
		it{should have_content(:text, 'logout')}

		
		describe "and user entered data" do
			before do
			  	select "2013", 			from: "transaction[trans_date(1i)]"
			  	select "August", 		from: "transaction[trans_date(2i)]"
			  	select "16", 			from: "transaction[trans_date(3i)]"
				select 	"Flour", 		from: "transaction[item_id]"
				fill_in "Trans amount", with: 300
			end

			it "should create a new item" do
				expect {click_button "Create Transaction"}.to change(Transaction, :count).by(1)
			end

			it "should add new item to trans-list" do
				click_button "Create Transaction"
				should have_selector('span', text: "Flour")
			end
		end
	end

end
