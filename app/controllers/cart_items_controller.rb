class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:show, :update, :destroy, :edit]
  before_action :set_customer

  # カート内アイテムの表示
  def index
    @cart_items = current_customer.cart_items
    #@total_price = @cart_items.sum(:price)
  end

   # アイテムの追加
  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id,customer_id: @cart_item.customer_id)
    if @cart_item.nil?
      @current_item.quantity += @cart_item.quantity
      @current_item.update(cart_item_params)
      redirect_to cart_items_path
    end
      if @cart_item.save
        flash[:notice] = '商品が追加されました。'
        redirect_to cart_items_path
      else
        @carts_items = @customer.cart_items.all
        render 'index'
        flash[:alert] = '商品の追加に失敗しました。'
      end

      # if @cart_item.blank?
      #   @cart_items = current_customer.cart_items.build(item_id: params[:id])
      # end
      # @cart_item.quantity += params[:quantity].to_i
      # if @cart_item.save
      #   flash[:notice] = '商品が追加されました。'
      #   redirect_to
      # else
      #   flash[:alert] = '商品の追加に失敗しました。'
      #   redirect_to
      # end
  end

   def update

    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
    end
    # @cart_items = current_customer.cart_items
    # @cart_items.each do |item|
    #     item.quantity = params[:quantity][item.id.to_s].to_i
    #     item.price = item.quantity * item.product.price
    #     item.save
    #     flash[:success] =  "更新に成功しました"
    #   end
    #     flash[:warning] = "入力内容を確認してください"
    #     redirect_to cart_items_path

   end


   def all_destroy
      # @cart_items = @customer.cart_items
      # @cart_items.all_destroy
      @customer.cart_items.all_destroy
       redirect_to cart_items_path
       flash[:info] = 'カートを空にしました。'
   end

   def destroy
      # @cart_item = CartItem.find(params[:id])
       @cart_item.destroy
       redirect_to cart_items_path
   end

   private

   def set_customer
    @customer = current_customer
   end

   def set_cart_item
    @cart_item = CartItem.find(params[:id])
   end

   def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
   end

end
