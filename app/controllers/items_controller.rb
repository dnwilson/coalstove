class ItemsController < ApplicationController
   
   def new
      @item = Item.new(item_params)
      @categories = Category.all
   end
   def create
      @item = Item.new(item_params)
      @categories = Category.all
   end
   
   private
   
      def item_params
         params.require(:item).permit(:item_name, :category_id, :item_amount)
      end
end
