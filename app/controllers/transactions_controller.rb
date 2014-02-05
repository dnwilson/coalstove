class TransactionsController < ApplicationController
   before_filter :user_signed_in?, only: [:create, :destroy]
   
   def create
      @transaction = current_user.transactions.build(trans_params)
   end
   
   private
   
      def trans_params
         params.require(:transaction).permit(:item_id, :trans_amount, :trans_date)
      end
end
