class TransactionsController < ApplicationController
   before_filter :signed_in?, only: [:create, :destroy]
   before_filter :verify_is_admin

   def create
	  @transaction = current_user.transactions.build(trans_params)
   end
   
   private
   
      def trans_params
         params.require(:transaction).permit(:item_id, :trans_amount, :trans_date)
      end

      def verify_is_admin
      	(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
      end
end
