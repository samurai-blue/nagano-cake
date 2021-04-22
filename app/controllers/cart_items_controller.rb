class CartItemsController < ApplicationController
  
  befoer_action :authenticate_customer!
  
  # カート内アイテムの表示
  def index
    @cart_items = current_cart
  end
  
   # アイテムの追加
   def create
    @cart_items = current_customer.cart_items.build(item_id: params[:id]) if @cart_item.blank?
    @cart_item.quantity += params[:quantity].to_i
    if @cart_item.save
      flash[:notice] = '商品が追加されました。'
      redirect_to 
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to
    end
   end
   
   def update
   end
   
   def all_destroy
   end
   
   def destroy
   end
   
   private
   
   
end
