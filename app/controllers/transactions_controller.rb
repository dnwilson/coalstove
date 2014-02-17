class TransactionsController < ApplicationController
   before_filter :signed_in?, only: [:create, :destroy]
   before_filter :verify_is_admin

   autocomplete :item, :item_name

   def create
	  @transaction = current_user.transactions.build(trans_params)
	  @items = Item.all
	  @transactions = Transaction.all
	  respond_to do |format|
	  	if @transaction.save
			format.html {redirect_to new_transaction_path}
			format.json {render json: @transaction, status: :created, location: @transaction}
			format.js
		else
			format.html {render 'transactions/new'}
			format.json {render json: @transaction.errors, status: :unprocessable_entity}
			format.js {render'transactions/new'}
		end
	  end
   end

   def new
	  @transaction = Transaction.new
	  @items = Item.all
	  @transactions = Transaction.all
   end
   
   private
   
      def trans_params
         params.require(:transaction).permit(:item_name, :item_id, :trans_amount, :trans_date)
      end

      def verify_is_admin
      	(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
      end
end
