class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def cuurent_index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render :index
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
    @order_details.each do |order_detail|
      @sum += order_detail.total_payment
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを変更しました"
		  redirect_to admin_order_path(@order)
    else
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end