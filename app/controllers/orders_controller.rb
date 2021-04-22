class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to finish_orders_parh
    # カート商品の情報を注文商品に移動
    #空の@order_itemsを作成し、 order_idとitem_idにそれぞれ、OrderモデルのidとItemモデルのidを代入するという流れ
    @cart_items = current_cart
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.item_id = cart_item.item.id
      @order_items.name = cart_item.item.name
      @order_items.price = cart_item.item.price
      @order_items.quantity = cart_item.item.quantity
      @order_items.save
      #@order_items.newと@order_items.saveもeach文,cart_itemの数だけデータを保存する
    end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy.all
  end

  def new
    @order = Order.new
    @shippings = Shipping.where(customer: current_customer)
  end

  def check
  end

  def finish
  end
end
