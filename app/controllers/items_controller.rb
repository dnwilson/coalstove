class ItemsController < ApplicationController
   before_filter :signed_in?, only: [:create, :destroy]
   before_filter :verify_is_admin

   def new
      if current_user.admin?
         @item = Item.new
         @items = Item.all
         @categories = Category.all         
      else
         flash[:notice] = "You do not have permission to carry out this function"
      end
   end
   
   def create
      if current_user.admin?
         @item = Item.new(item_params)
         @items = Item.all
         @categories = Category.all         
      else
         flash[:notice] = "You do not have permission to carry out this function"
      end
      respond_to do |format|
         if @item.save
            format.html {redirect_to new_item_path}
            format.json {render json: @item, status: :created, location: @item}
            format.js
         else
            format.html {render 'items/new'}
            format.json {render json: @item.errors, status: :unprocessable_entity}
            format.js {render'items/new'}
         end
      end
   end

   def edit
      @item = Item.find(params[:id])
   end

   def update
      @item = Item.find(params[:id])
      respond_to do |format|
         if @item.update_attributes(item_params)
            format.html {redirect_to new_item_path}
            format.json {head :no_content}
            format.js
         else
            format.html {render action: "edit"}
            format.json {render json: @item.errors, status: :unprocessable_entity}
            format.js {render'items/edit'}
         end
      end
   end
   
   private
   
      def item_params
         params.require(:item).permit(:item_name, :category_id, :item_amount)
      end

      def verify_is_admin
         (current_user.nil?) ? redirect_to(root_path) && flash[:notice] = "You do not have permission to carry out this function" : (redirect_to(root_path) unless current_user.admin?)
      end
end
