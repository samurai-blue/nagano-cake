class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  # before_action :set_cart_item, only: [:index, :update, :destroy, :edit]
  # before_action :処理させたいメソッド名, only: [:アクション1,:アクション2]
  # before_action :set_customer

  # カート内アイテムの表示
  def index
    @cart_items = current_customer.cart_items
    #@total_price = @cart_items.sum(:price)
  end

   # アイテムの追加
  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.customer_id = current_customer.id
    @current_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    # パラメーターの変更
    # save前の変数（Param）の内容は使えない。
    # モデルのitemsをなおした
    # privateの２つはいらなかった（トレースができない）
    # updateをsaveに変更した。quantityのみのへんこうだからsave。updateは全部変更してしまう


      # @cart_item.customer_id = current_customer.id
        #税抜の小計価格を設定
      # @cart_item.price = @cart_item.product.price * @cart_item.quantity
    if @current_item.nil?
      if @cart_item.save
        flash[:notice] = '商品が追加されました。'
        redirect_to cart_items_path
      else
        @carts_items = current_customer.cart_items.all
        render 'index'
        flash[:alert] = '商品の追加に失敗しました。'
      end
    else
      @current_item.quantity += params[:cart_item][:quantity].to_i
      @current_item.save
      redirect_to cart_items_path
    end
  end

   def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.update(item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
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


   def destroy_all
      @cart_items = current_customer.cart_items
      @cart_items.destroy_all
      redirect_to cart_items_path
      flash[:info] = 'カートを空にしました。'
   end

   def destroy
       @cart_item = CartItem.find(params[:id])
       @cart_item.destroy
       redirect_to cart_items_path
   end

   private

  # def set_customer
  #   @customer = current_customer
  # end

  # def set_cart_item
  #   # @cart_item = CartItem.find(params[:id])
  # end

   def item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
   end

end
