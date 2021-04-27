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
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを変更しました"
		  redirect_to admin_order_path(@order)
    else
    end
  end
  
end