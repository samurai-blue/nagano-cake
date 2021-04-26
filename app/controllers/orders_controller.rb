class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def new
    @order = Order.new
    @customer = current_customer
    
    # @shippings = @customer.shippings.all
  end


  def check
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    # 住所のラジオボタン選択に応じて引数を調整
    @add = params[:order][:add].to_i
    case @add
      when 1
        @order.postal_code = @customer.postal_code
        @order.send_to_address = @customer.address
        @order.name = @customer.last_name + @customer.first_name
      when 2
        @sta = params[:order][:send_to_address].to_i
        @send_to_address = Shipping.find(@sta)
        @order.postal_code = @send_to_address.postal_code
        @order.send_to_address = @send_to_address.address
        @order.name = @send_to_address.name
      when 3
        @order.postal_code = params[:order][:new_add][:postal_code]
        @order.send_to_address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end


  def create
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      # 住所のラジオボタン選択に応じて引数を調整
      @add = params[:order][:add].to_i
      case @add
        when 1
          @order.postal_code = @customer.postal_code
          @order.send_to_address = @customer.address
          @order.name = full_name(@customer)
        when 2
          @order.postal_code = params[:order][:postal_code]
          @order.send_to_address = params[:order][:send_to_address]
          @order.name = params[:order][:name]
        when 3
          @order.postal_code = params[:order][:postal_code]
          @order.send_to_address = params[:order][:send_to_address]
          @order.name = params[:order][:name]
      end
      @order.save

      # send_to_addressで住所モデル検索、該当データなければ新規作成
      if Shipping.find_by(address: @order.send_to_address).nil?
        @address = Shipping.new
        @address.postal_code = @order.postal_code
        @address.address = @order.send_to_address
        @address.name = @order.name
        @address.customer_id = current_customer.id
        @address.save
      end

      # cart_itemsの内容をorder_itemsに新規登録
      current_customer.cart_items.each do |cart_item|
        order_item = @order.order_items.build
        order_item.order_id = @order.id
        order_item.item_id = cart_item.item_id
        order_item.quantity = cart_item.quantity
        order_item.total_payment = cart_item.item.price
        order_item.save
        cart_item.destroy #order_itemに情報を移したらcart_itemは消去
      end
      render :finish
    else
      redirect_to customer_top_path
　flash[:danger] = 'カートが空です。'
    end
  end

  def finish
  end

  def index
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_back(fallback_location: root_path)
      flash[:alert] = "アクセスに失敗しました。"
    end
  end

  private
  def set_customer
    @customer = current_customer
  end

  def order_params
    params.require(:order).permit(
      :created_at, :send_to_address, :name, :order_status, :payment_method, :postal_code, :shipping_cost,
      order_details_attributes: [:order_id, :item_id, :quantity, :total_payment, :production_status]
      )
  end

end



  # before_action :authenticate_customer!


  # def index
  #   @orders = current_customer.orders
  # end

  # def show
  #   @order = Order.find(params[:id])
  # end

  # def create
  #   @order = current_customer.orders.new(order_params)
  #   @order.save
  #   flash[:notice] = "ご注文が確定しました。"
  #   redirect_to finish_orders_parh
    # カート商品の情報を注文商品に移動
    #空の@order_itemsを作成し、 order_idとitem_idにそれぞれ、OrderモデルのidとItemモデルのidを代入するという流れ
    # @cart_items = current_cart
    # @cart_items.each do |cart_item|
    #   @order_items = @order.order_items.new
    #   @order_items.item_id = cart_item.item.id
    #   @order_items.name = cart_item.item.name
    #   @order_items.price = cart_item.item.price
    #   @order_items.quantity = cart_item.item.quantity
    #   @order_items.save
      #@order_items.newと@order_items.saveもeach文,cart_itemの数だけデータを保存する
    # end
    # 注文完了後、カート商品を空にする
    # @cart_items.destroy.all
  # end

  # def new
  #   @order = Order.new
  #   @shippings = Shipping.where(customer: current_customer)
  # end

  # def check
  # end

  # def finish
  # end